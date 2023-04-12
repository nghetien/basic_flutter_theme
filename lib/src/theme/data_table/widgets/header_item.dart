part of '../data_table.dart';

class DataTableHeaderItemWidget<T> extends StatelessWidget {
  const DataTableHeaderItemWidget({
    Key? key,
    required this.index,
    required this.lengthOfColumn,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    required this.column,
    required this.headerOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final int index;
  final int lengthOfColumn;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final DataTableColumn<T> column;
  final DataTableHeaderOption headerOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fixedColumn == FixedColumn.none
          ? controller.mapKeyToWidthOfEachColumnContent[column.key]
          : column.width,
      height: headerOption.heightOfHeaderItem ?? DataTableHeaderWidget.defaultHeightHeader,
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
        child: _getWidgetHeaderItem(context),
      ),
    );
  }

  Widget _getWidgetHeaderItem(BuildContext context) {
    if (column.key == DataTableAdditionColumn.checkbox.toString()) {
      return SizedBox(
        width: column.width,
        child: CheckBoxColumn(
          controller: controller,
          onSelectCheckBox: checkBoxOption.onSelectCheckBox,
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
    final double? widthOfRowItem = fixedColumn != FixedColumn.none
        ? column.width
        : controller.mapKeyToWidthOfEachColumnContent[column.key];
    return Stack(
      children: <Widget>[
        column.customizeTitleWidget != null
            ? column.customizeTitleWidget!(
                context,
                column.key,
                column.name,
                widthOfRowItem,
                column.showOnScreens,
              )
            : Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: BasicPaddings.p8),
                child: Text(
                  column.name,
                  textAlign: TextAlign.center,
                  style: BasicTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                    color: BasicAppColors.white,
                  ),
                ),
              ),
        if (headerOption.isShowSortFilter)
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
                        Text(headerOption.customizeSortDesc),
                        HSpace.p8,
                        const Icon(Icons.arrow_downward_rounded),
                      ],
                    ),
                    onTap: () => headerOption.sortDataVoid?.call(
                      keyColumn: column.key,
                      typeSort: DataTableSortType.desc,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: DataTableSortType.asc.toString(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(headerOption.customizeSortAsc),
                        HSpace.p8,
                        const Icon(Icons.arrow_upward_rounded),
                      ],
                    ),
                    onTap: () => headerOption.sortDataVoid?.call(
                      keyColumn: column.key,
                      typeSort: DataTableSortType.asc,
                    ),
                  ),
                  if (headerOption.additionFilter[column.key] != null)
                    ...headerOption.additionFilter[column.key]!,
                ];
              },
              offset: Offset(
                  0, headerOption.heightOfHeaderItem ?? DataTableHeaderWidget.defaultHeightHeader),
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
