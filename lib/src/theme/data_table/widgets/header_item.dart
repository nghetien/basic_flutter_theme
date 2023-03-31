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
    this.onSelectCheckBox,
  }) : super(key: key);

  final int index;
  final int lengthOfColumn;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableOptionUI dataTableOptionUI;
  final SortDataVoid? sortDataVoid;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final Function(Map<int, T>)? onSelectCheckBox;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedColumn == FixedColumn.none
          ? controller.mapKeyToWidthOfEachColumnContent[column.key]
          : column.width,
      height: DataTableHeaderWidget.defaultHeightHeader,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: index < lengthOfColumn - 1
                ? BorderSide(
                    color: BasicAppColors.greyOpacity04,
                    width: BasicBorders.thin,
                  )
                : BorderSide.none,
          ),
        ),
        child: _getWidgetHeaderItem(),
      ),
    );
  }

  Widget _getWidgetHeaderItem() {
    if (column.key == DataTableAdditionColumn.checkbox.toString()) {
      return SizedBox(
        width: column.width,
        child: CheckBoxColumn(
          controller: controller,
          onSelectCheckBox: onSelectCheckBox,
        ),
      );
    }
    if (column.key == DataTableAdditionColumn.numbered.toString()) {
      return SizedBox(
        width: column.width,
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
    return Stack(
      children: <Widget>[
        Container(
          alignment: column.customizeTitleWidget?.alignment ?? Alignment.center,
          padding: column.customizeTitleWidget?.padding ??
              EdgeInsets.symmetric(horizontal: BasicPaddings.p8),
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
                        const Icon(Icons.arrow_downward_rounded),
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
                        const Icon(Icons.arrow_upward_rounded),
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
                padding: EdgeInsets.symmetric(horizontal: BasicPaddings.p8),
                child: Icon(
                  Icons.menu_rounded,
                  color: BasicAppColors.white,
                  size: BasicIconSizes.s18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
