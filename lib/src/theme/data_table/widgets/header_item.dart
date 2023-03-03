part of '../data_table.dart';

class DataTableHeaderItemWidget<T> extends StatelessWidget {
  const DataTableHeaderItemWidget({
    Key? key,
    required this.index,
    required this.lengthOfColumn,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    this.sortDataVoid,
    required this.column,
    required this.dataTableOptionUI,
    required this.additionFilter,
  }) : super(key: key);

  final int index;
  final int lengthOfColumn;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableOptionUI dataTableOptionUI;
  final SortDataVoid? sortDataVoid;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;

  @override
  Widget build(BuildContext context) {
    return _wrapItem(
      flex: column.flex,
      width: column.width,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: DataTableHeaderWidget.defaultHeightHeader,
            alignment: column.customizeTitleWidget?.alignment ?? Alignment.center,
            padding: column.customizeTitleWidget?.padding ??
                EdgeInsets.symmetric(horizontal: BasicPaddings().p8),
            child: Text(
              column.customizeTitleWidget?.title ?? column.name,
              textAlign: TextAlign.center,
              style: BasicTextStyles.body.copyWith(
                fontWeight: FontWeight.bold,
                color: BasicAppColors.white,
              ),
            ),
          ),
          if (dataTableOptionUI.isShowSortFilter)
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
                          Text(dataTableOptionUI.customizeSortDesc),
                          HSpace.p8,
                          const Icon(
                            EvaIcons.arrowIosDownwardOutline,
                          ),
                        ],
                      ),
                      onTap: () => sortDataVoid?.call(
                        keyColumn: column.key,
                        typeSort: DataTableSortType.desc,
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: DataTableSortType.asc.toString(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dataTableOptionUI.customizeSortAsc),
                          HSpace.p8,
                          const Icon(
                            EvaIcons.arrowIosUpwardOutline,
                          ),
                        ],
                      ),
                      onTap: () => sortDataVoid?.call(
                        keyColumn: column.key,
                        typeSort: DataTableSortType.asc,
                      ),
                    ),
                    if (additionFilter[column.key] != null) ...additionFilter[column.key]!,
                  ];
                },
                offset: Offset(0, DataTableHeaderWidget.defaultHeightHeader),
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

  Widget _wrapItem({
    required Widget child,
    double? width,
    int? flex,
  }) {
    return width != null
        ? SizedBox(
            width: width,
            child: _wrapItemBorder(
              child: child,
            ),
          )
        : Expanded(
            flex: flex ?? 1,
            child: LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                if (column.maxWidth != null && (constraints.maxWidth > column.maxWidth!)) {
                  return SizedBox(
                    width: column.maxWidth,
                    child: _wrapItemBorder(
                      child: child,
                    ),
                  );
                }
                if (column.minWidth != null && constraints.maxWidth < column.minWidth!) {
                  return SizedBox(
                    width: column.minWidth,
                    child: _wrapItemBorder(
                      child: child,
                    ),
                  );
                }
                return _wrapItemBorder(
                  child: child,
                );
              },
            ),
          );
  }

  Widget _wrapItemBorder({
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: DataTableHeaderWidget.getBorderLeft(
            index: index,
            fixedColumn: fixedColumn,
            lengthOfColumn: lengthOfColumn,
            haveFixedColumnsLeft: controller.haveFixedColumnsLeft,
          ),
          right: DataTableHeaderWidget.getBorderRight(
            index: index,
            fixedColumn: fixedColumn,
            lengthOfColumn: lengthOfColumn,
            haveFixedColumnsRight: controller.haveFixedColumnsRight,
          ),
        ),
      ),
      child: child,
    );
  }
}
