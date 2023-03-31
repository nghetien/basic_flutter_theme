part of '../data_table.dart';

class DataTableRowWidget<T> extends StatelessWidget {
  const DataTableRowWidget({
    Key? key,
    required this.tableColumns,
    this.fixedColumn = FixedColumn.none,
    required this.controller,
    required this.indexRow,
    required this.rowData,
    this.isShowMore = false,
    this.showerMoreContentRowWidget,
    required this.onPressed,
    this.height,
    required this.dataTableOptionUI,
    this.onSelectCheckBox,
  }) : super(key: key);

  final List<DataTableColumn<T>> tableColumns;
  final FixedColumn fixedColumn;
  final DataTableController<T> controller;
  final int indexRow;
  final T rowData;
  final bool isShowMore;
  final VoidCallback onPressed;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentRowWidget;
  final double? height;
  final DataTableOptionUI dataTableOptionUI;
  final Function(Map<int, T>)? onSelectCheckBox;

  @override
  Widget build(BuildContext context) {
    if (fixedColumn != FixedColumn.none) {
      return Column(
        children: <Widget>[
          _wrapContent(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _generateRowItem(context),
              ),
            ),
          ),
          if (isShowMore)
            _wrapShowMore(
              child: showerMoreContentRowWidget!(rowData),
            )
        ],
      );
    }
    return MeasureSize(
      onChange: (Size size) {
        final bool canEdit = controller.canEditHeightOfEachRow(
          indexRow,
          size.height,
        );
        if(canEdit) controller.reloadHeightFixedContent();
      },
      child: Column(
        children: <Widget>[
          _wrapContent(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _generateRowItem(context),
              ),
            ),
          ),
          if (isShowMore)
            _wrapShowMore(
              child: showerMoreContentRowWidget!(rowData),
            )
        ],
      ),
    );
  }

  List<Widget> _generateRowItem(BuildContext context) {
    final List<Widget> rowItems = [];
    for (int indexColumn = 0; indexColumn < tableColumns.length; indexColumn++) {
      if (isShowInScreen(tableColumns[indexColumn].showOnScreens)) {
        rowItems.add(
          DataTableRowItemWidget(
            fixedColumn: fixedColumn,
            indexRow: indexRow,
            indexColumn: indexColumn,
            lengthOfColumn: tableColumns.length,
            rowData: rowData,
            controller: controller,
            column: tableColumns[indexColumn],
            dataTableOptionUI: dataTableOptionUI,
            onSelectCheckBox: onSelectCheckBox,
          ),
        );
      }
    }
    return rowItems;
  }

  Widget _wrapContent({required Widget child}) => Container(
    height: height,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: BasicBorders.thin,
              color: BasicAppColors.greyOpacity04,
            ),
          ),
        ),
        child: fixedColumn != FixedColumn.none ||
                controller.haveFixedColumnsLeft ||
                controller.haveFixedColumnsRight
            ? child
            : InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashColor: Colors.transparent,
                onTap: onPressed,
                mouseCursor: isShowMore ? SystemMouseCursors.click : SystemMouseCursors.basic,
                child: child,
              ),
      );

  Widget _wrapShowMore({required Widget child}) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
            right: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
            left: BorderSide(width: BasicBorders.thin, color: BasicAppColors.greyOpacity04),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(BasicPaddings.p4),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: BasicBorders.thick, color: BasicAppColors.primary),
              left: BorderSide(width: BasicBorders.thick, color: BasicAppColors.primary),
            ),
          ),
          child: child,
        ),
      );
}
