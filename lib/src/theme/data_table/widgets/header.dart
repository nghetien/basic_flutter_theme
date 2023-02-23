part of '../data_table.dart';

class DataTableHeaderWidget<T> extends StatefulWidget {
  const DataTableHeaderWidget({
    Key? key,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    required this.additionFilter,
  }) : super(key: key);

  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;

  @override
  DataTableHeaderWidgetState<T> createState() => DataTableHeaderWidgetState<T>();
}

class DataTableHeaderWidgetState<T> extends State<DataTableHeaderWidget<T>> {
  static final double defaultHeightHeader = 40.scaleSize;

  @override
  Widget build(BuildContext context) {
    final List<DataTableColumn<T>> tableColumnsForScreenWidth =
        getListColumnForScreenDevice(widget.controller.tableColumns);
    List<Widget> headers = [];
    for (int index = 0; index < tableColumnsForScreenWidth.length; index++) {
      if (tableColumnsForScreenWidth[index].key == DataTableAdditionColumn.numbered.toString()) {
        headers.add(_numberedColumn());
      } else if (tableColumnsForScreenWidth[index].key ==
          DataTableAdditionColumn.checkbox.toString()) {
        headers.add(_checkboxColumn());
      } else {
        headers.add(
          wrapItem(
            index: index,
            flex: tableColumnsForScreenWidth[index].flex,
            width: tableColumnsForScreenWidth[index].width,
            child: _headerItem(
              key: tableColumnsForScreenWidth[index].key,
              text: tableColumnsForScreenWidth[index].name,
            ),
          ),
        );
      }
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: BasicCorners.cornerRadius8,
          topLeft: BasicCorners.cornerRadius8,
        ),
        color: BasicAppColors().primary,
      ),
      child: Row(
        children: headers,
      ),
    );
  }

  Widget _numberedColumn() => Container(
        width: getWithAdditionColumn(widget.controller.additionColumn),
        height: defaultHeightHeader,
        alignment: Alignment.center,
        child: Text(
          'No.',
          textAlign: TextAlign.center,
          style: BasicTextStyles.body.copyWith(
            fontWeight: FontWeight.bold,
            color: BasicAppColors.white,
          ),
        ),
      );

  Widget _checkboxColumn() => SizedBox(
        width: getWithAdditionColumn(widget.controller.additionColumn),
        height: defaultHeightHeader,
        child: CheckBoxColumn(
          controller: widget.controller,
        ),
      );

  Widget _headerItem({
    required String text,
    required String key,
  }) =>
      Align(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: defaultHeightHeader,
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: BasicTextStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                  color: BasicAppColors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: CustomPopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: DataTableSortType.desc.toString(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.dataTableOptionUI.customizeSortDesc),
                          HSpace.p8,
                          const Icon(
                            EvaIcons.arrowIosDownwardOutline,
                          ),
                        ],
                      ),
                      onTap: () => widget.sortDataVoid?.call(
                        keyColumn: key,
                        typeSort: DataTableSortType.desc,
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: DataTableSortType.asc.toString(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.dataTableOptionUI.customizeSortAsc),
                          HSpace.p8,
                          const Icon(
                            EvaIcons.arrowIosUpwardOutline,
                          ),
                        ],
                      ),
                      onTap: () => widget.sortDataVoid?.call(
                        keyColumn: key,
                        typeSort: DataTableSortType.asc,
                      ),
                    ),
                    if (widget.additionFilter[key] != null) ...widget.additionFilter[key]!,
                  ];
                },
                offset: Offset(0, defaultHeightHeader),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: BasicPaddings().p8),
                  child: Icon(
                    EvaIcons.menu,
                    color: BasicAppColors.white,
                    size: BasicIconSizes().s18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
