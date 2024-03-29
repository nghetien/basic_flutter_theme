part of '../data_table.dart';

class DataTablePaginationWidget<T> extends StatefulWidget {
  const DataTablePaginationWidget({
    Key? key,
    required this.handleChangeData,
    required this.controller,
    required this.paginationOption,
  }) : super(key: key);

  final DataTableController<T> controller;
  final AsyncDataSource<T> handleChangeData;
  final DataTablePaginationOption paginationOption;

  @override
  State<DataTablePaginationWidget> createState() => _DataTablePaginationWidgetState();
}

class _DataTablePaginationWidgetState extends State<DataTablePaginationWidget> {
  DataTablePagination get pagination => widget.controller.pagination;

  static final sizePageNumber = 25.scaleSize;
  static const int threeDotFlagNumber = 0;

  void _handleChangeDataPageNumber(int pageNumber) {
    if (pageNumber == pagination.currentPage) return;
    widget.controller.setCurrentPage(pageNumber);
    if (widget.controller.additionColumns.contains(DataTableAdditionColumn.checkbox)) {
      widget.controller.clearSelected();
    }
    widget.handleChangeData(
      currentPage: pagination.currentPage,
      itemsPerPage: pagination.itemsPerPage,
    );
  }

  void _handleChangeDataPageLeft(bool isBackToTheFirst) {
    if (isBackToTheFirst) {
      _handleChangeDataPageNumber(1);
      return;
    }
    if (pagination.currentPage > 1) _handleChangeDataPageNumber(pagination.currentPage - 1);
  }

  void _handleChangeDataPageRight(bool isBackToTheEnd) {
    if (isBackToTheEnd) {
      _handleChangeDataPageNumber(pagination.pageNumber);
      return;
    }
    if (pagination.currentPage < pagination.pageNumber) {
      _handleChangeDataPageNumber(pagination.currentPage + 1);
    }
  }

  void _handleChangeItemPerPage(int? itemPerPage) {
    if (itemPerPage == null) return;
    if (itemPerPage == pagination.itemsPerPage) return;
    widget.controller.setCurrentPage(1);
    widget.controller.setItemsPerPage(itemPerPage);
    widget.controller.setPageNumber(widget.controller.calculatePageNumber(itemPerPage));
    widget.handleChangeData(
      currentPage: pagination.currentPage,
      itemsPerPage: pagination.itemsPerPage,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.calculatePagination();
    return LayoutBuilder(
      builder: (_, constrains) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: BasicPaddings.p8,
          vertical: BasicPaddings.p4 / 2,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: BasicAppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: widget.paginationOption.borderRadius ?? BasicCorners.mainCornerRadius,
            bottomRight: widget.paginationOption.borderRadius ?? BasicCorners.mainCornerRadius,
          ),
        ),
        child: widget.paginationOption.isShowPagination
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _nextPageLeft(),
                        _pageNumberWidget(),
                        _nextPageRight(),
                        HSpace.p14,
                        _dropdownItemsPerPage(),
                      ],
                    ),
                  ),
                  if (BasicConfigResponsive.screenDevice.isDesktop) _fromToItemsInPage(),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _fromToItemsInPage(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _nextPageLeft() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (!BasicPlatform.isMobile)
          IconButton(
            onPressed: () => _handleChangeDataPageLeft(true),
            icon: const Icon(
              Icons.keyboard_double_arrow_left_rounded,
              color: BasicAppColors.white,
            ),
          ),
        IconButton(
          onPressed: () => _handleChangeDataPageLeft(false),
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: BasicAppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _customBtnPageNumber({
    required int number,
    required VoidCallback onPressed,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: BasicPaddings.p4),
        child: BasicButton(
          height: sizePageNumber,
          width: sizePageNumber,
          size: BasicButtonSize.medium,
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          text: number > 0 ? number.toString() : '...',
          textStyle: TextStyle(
            color: number == pagination.currentPage ? BasicAppColors.primary : BasicAppColors.white,
          ),
          background:
              number == pagination.currentPage ? BasicAppColors.white : BasicAppColors.primary,
        ),
      );

  Widget _pageNumberWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (pagination.currentPage - pagination.numberNextPage - pagination.excessStart - 1 > 0)
          _customBtnPageNumber(
            onPressed: () => _handleChangeDataPageNumber(
              pagination.currentPage - pagination.numberNextPage - pagination.excessStart - 1,
            ),
            number: threeDotFlagNumber,
          ),
        for (int number = pagination.startPage; number < pagination.endPage + 1; number++)
          _customBtnPageNumber(
            onPressed: () => _handleChangeDataPageNumber(number),
            number: number,
          ),
        if (pagination.currentPage + pagination.numberNextPage + pagination.excessEnd <
            pagination.pageNumber)
          _customBtnPageNumber(
            onPressed: () => _handleChangeDataPageNumber(
              pagination.currentPage + pagination.numberNextPage + pagination.excessEnd + 1,
            ),
            number: threeDotFlagNumber,
          )
      ],
    );
  }

  Widget _nextPageRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () => _handleChangeDataPageRight(false),
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: BasicAppColors.white,
          ),
        ),
        if (!BasicPlatform.isMobile)
          IconButton(
            onPressed: () => _handleChangeDataPageRight(true),
            icon: const Icon(
              Icons.keyboard_double_arrow_right_rounded,
              color: BasicAppColors.white,
            ),
          ),
      ],
    );
  }

  final _itemPerPageValueController = TextEditingController();

  Widget _dropdownItemsPerPage() {
    _itemPerPageValueController.text = pagination.itemsPerPage.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: sizePageNumber + 2,
          child: BasicInputDropdown<int>(
            width: 75.scaleSize,
            controller: _itemPerPageValueController,
            contentPadding: EdgeInsets.symmetric(horizontal: BasicPaddings.p4),
            menuChildren: [
              for (final item in pagination.listItemsPerPage)
                BasicInputDropdownItemModel<int>(
                  value: item,
                  label: item.toString(),
                ),
            ],
            onSelected: (item) {
              _itemPerPageValueController.text = item.value.toString();
              _handleChangeItemPerPage(item.value);
            },
          ),
        ),
        if (BasicConfigResponsive.screenDevice.isDesktop)
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: BasicPaddings.p8),
              child: Text(
                widget.paginationOption.customizeItemPerPage,
                style: const TextStyle(
                  color: BasicAppColors.white,
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _fromToItemsInPage() {
    final fromItem = (pagination.currentPage - 1) * pagination.itemsPerPage;
    final toItem = pagination.currentPage * pagination.itemsPerPage;
    final int toItemStr = toItem > widget.controller.totalRecords ? widget.controller.totalRecords : toItem;
    final int fromItemStr = fromItem > 0 ? fromItem : toItemStr == 0 ? 0 : 1;
    final int totalRecords = widget.controller.totalRecords;
    return Text(
      widget.paginationOption.isShowPagination
          ? (widget.paginationOption.customizeFromToItemInPage != null
              ? widget.paginationOption.customizeFromToItemInPage!(
                  fromItem,
                  toItem > widget.controller.totalRecords ? widget.controller.totalRecords : toItem,
                  widget.controller.totalRecords,
                )
              : '$fromItemStr - $toItemStr of $totalRecords items')
          : '$totalRecords items',
      style: const TextStyle(
        color: BasicAppColors.white,
      ),
    );
  }
}
