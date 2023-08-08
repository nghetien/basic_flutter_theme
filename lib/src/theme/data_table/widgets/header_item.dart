part of '../data_table.dart';

class DataTableHeaderItemWidget<T> extends StatefulWidget {
  const DataTableHeaderItemWidget({
    Key? key,
    required this.index,
    required this.lengthOfColumn,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    required this.column,
    required this.headerOption,
    required this.checkBoxOption,
    required this.sortType,
    required this.onSelectSortType,
  }) : super(key: key);

  final int index;
  final int lengthOfColumn;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableHeaderOption headerOption;
  final DataTableCheckBoxOption<T> checkBoxOption;
  final MapEntry<String, DataTableSortType> sortType;
  final ValueChanged<MapEntry<String, DataTableSortType>> onSelectSortType;

  @override
  State<DataTableHeaderItemWidget<T>> createState() => _DataTableHeaderItemWidgetState<T>();
}

class _DataTableHeaderItemWidgetState<T> extends State<DataTableHeaderItemWidget<T>> {
  final MenuController _menuController = MenuController();
  bool _enableFilter = false;
  bool _isShowMenu = false;

  bool get enableFilter => _enableFilter;

  bool get isShowMenu => _isShowMenu;

  void _setEnableFilter(bool value) => setState(() => _enableFilter = value);

  void _setIsShowMenu(bool value) => _isShowMenu = value;

  void _handleChangeSortType() {
    late DataTableSortType type;
    if (widget.column.key != widget.sortType.key) {
      type = DataTableSortType.asc;
      widget.onSelectSortType(MapEntry(widget.column.key, DataTableSortType.asc));
    } else {
      switch (widget.sortType.value) {
        case DataTableSortType.none:
          type = DataTableSortType.asc;
          widget.onSelectSortType(MapEntry(widget.column.key, DataTableSortType.asc));
          break;
        case DataTableSortType.asc:
          type = DataTableSortType.desc;
          widget.onSelectSortType(MapEntry(widget.column.key, DataTableSortType.desc));
          break;
        case DataTableSortType.desc:
          type = DataTableSortType.none;
          widget.onSelectSortType(MapEntry(widget.column.key, DataTableSortType.none));
          break;
      }
    }
    widget.column.sortDataVoid?.call(
      widget.column.key,
      type,
      _handleFilterData,
    );
  }

  void _handleChangeShowMenu(bool value) {
    _setIsShowMenu(value);
    if (value) {
      _menuController.open();
    } else {
      _menuController.close();
    }
  }

  void _handleFilterData({
    required List<T> dataSources,
    int? totalRecords,
    int? currentPage,
    int? itemsPerPage,
    int? pageNumber,
  }) {
    widget.controller.setDataSources(dataSources);
    if (totalRecords != null) widget.controller.setTotalRecords(totalRecords);
    if (currentPage != null) widget.controller.setCurrentPage(currentPage);
    if (itemsPerPage != null) widget.controller.setItemsPerPage(itemsPerPage);
    if (pageNumber != null) widget.controller.setPageNumber(pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fixedColumn == FixedColumn.none
          ? widget.controller.mapKeyToWidthOfEachColumnContent[widget.column.key]
          : widget.column.width,
      height: widget.headerOption.heightOfHeaderItem ?? DataTableHeaderWidget.defaultHeightHeader,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: widget.index < widget.lengthOfColumn - 1
                ? BorderSide(
                    color: BasicAppColors.greyOpacity04,
                    width: BasicBorders.thin,
                  )
                : BorderSide.none,
          ),
        ),
        child: _getWidgetHeaderItem(context),
      ),
    );
  }

  Widget _getWidgetHeaderItem(BuildContext context) {
    if (widget.column.key == DataTableAdditionColumn.checkbox.toString()) {
      return SizedBox(
        width: widget.column.width,
        child: CheckBoxColumn(
          controller: widget.controller,
          onSelectCheckBox: widget.checkBoxOption.onSelectCheckBox,
        ),
      );
    }
    if (widget.column.key == DataTableAdditionColumn.numbered.toString()) {
      return SizedBox(
        width: widget.column.width,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'No.',
            textAlign: TextAlign.center,
            style: BasicTextStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: BasicAppColors.white,
            ),
          ),
        ),
      );
    }
    final double? widthOfRowItem = widget.fixedColumn != FixedColumn.none
        ? widget.column.width
        : widget.controller.mapKeyToWidthOfEachColumnContent[widget.column.key];
    return Stack(
      children: <Widget>[
        widget.column.customizeTitleWidget != null
            ? widget.column.customizeTitleWidget!(
                context,
                widget.column.key,
                widget.column.name,
                widthOfRowItem,
                widget.column.showOnScreens,
              )
            : Container(
                alignment: widget.headerOption.alignment ?? Alignment.center,
                padding: widget.headerOption.padding ??
                    EdgeInsets.symmetric(horizontal: BasicPaddings.p8),
                child: Text(
                  widget.column.name,
                  textAlign: TextAlign.center,
                  style: BasicTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: BasicAppColors.white,
                  ),
                ),
              ),
        if (widget.column.isShowSort || widget.column.isShowFilter)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Row(
              children: <Widget>[
                if (widget.column.isShowSort) _sortWidget(),
                if (widget.column.isShowFilter) _filterWidget(context),
              ],
            ),
          ),
      ],
    );
  }

  Widget _sortWidget() {
    return BasicButtonGestureDetector(
      onPressed: _handleChangeSortType,
      type: BasicButtonGestureDetectorType.customize,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: BasicPaddings.p8),
            child: Icon(
              Icons.arrow_drop_up_rounded,
              size: BasicIconSizes.s24,
              color: (widget.sortType.value == DataTableSortType.asc &&
                      widget.sortType.key == widget.column.key)
                  ? BasicAppColors.white
                  : BasicAppColors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: BasicPaddings.p8),
            child: Icon(
              Icons.arrow_drop_down_rounded,
              size: BasicIconSizes.s24,
              color: (widget.sortType.value == DataTableSortType.desc &&
                      widget.sortType.key == widget.column.key)
                  ? BasicAppColors.white
                  : BasicAppColors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _filterWidget(BuildContext context) {
    return MenuAnchor(
      crossAxisUnconstrained: false,
      controller: _menuController,
      alignmentOffset: widget.column.customizeFilter!.offset ?? const Offset(0, 10),
      style: MenuStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            widget.column.customizeFilter!.widthPopup,
            widget.column.customizeFilter!.heightPopup,
          ),
        ),
        visualDensity: VisualDensity.comfortable,
      ),
      menuChildren: [
        widget.column.customizeFilter!.child(
          context,
          widget.column.key,
          widget.column.name,
          enableFilter,
          isShowMenu,
          _setEnableFilter,
          _handleChangeShowMenu,
          _handleFilterData,
        ),
      ],
      builder: (context, controller, child) {
        return Padding(
          padding: EdgeInsets.only(right: BasicPaddings.p8),
          child: BasicButtonGestureDetector(
            onPressed: () => _handleChangeShowMenu(!_menuController.isOpen),
            type: BasicButtonGestureDetectorType.customize,
            child: Icon(
              Icons.filter_list_rounded,
              size: BasicIconSizes.s24,
              color: enableFilter ? BasicAppColors.white : BasicAppColors.grey,
            ),
          ),
        );
      },
    );
  }
}
