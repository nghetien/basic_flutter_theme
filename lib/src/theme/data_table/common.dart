part of 'data_table.dart';

List<DataTableColumn<T>> getListColumnForScreenDevice<T>(List<DataTableColumn<T>> listColumn) =>
    listColumn
        .where(
          (column) =>
              column.showOnScreens == null ||
              column.showOnScreens!.contains(BasicConfigResponsive().screenDevice),
        )
        .toList();

double getWithAdditionColumn(DataTableAdditionColumn additionColumn){
 switch (additionColumn) {
    case DataTableAdditionColumn.none:
      return 0;
    case DataTableAdditionColumn.numbered:
      return 60.scaleSize;
    case DataTableAdditionColumn.checkbox:
      return 60.scaleSize;
  }
}

Widget wrapItemBorder({
  required Widget child,
  required int index,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 0,
          color: index == 0 ? Colors.transparent : BasicAppColors.white,
        ),
      ),
    ),
    child: child,
  );
}

Widget wrapItem({
  required Widget child,
  double? width,
  required int index,
  int? flex,
}) {
  return width != null
      ? SizedBox(
          width: width,
          child: wrapItemBorder(
            child: child,
            index: index,
          ),
        )
      : Expanded(
          flex: flex ?? 1,
          child: wrapItemBorder(
            child: child,
            index: index,
          ),
        );
}

Widget wrapItemWithOutBorder({
  required Widget child,
  double? width,
  int? flex,
}) {
  return width != null
      ? SizedBox(width: width, child: child)
      : Expanded(flex: flex ?? 1, child: child);
}
