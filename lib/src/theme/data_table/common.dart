part of 'data_table.dart';

bool isShowInScreen<T>(List<BasicScreenDevice>? showOnScreens) {
  return showOnScreens == null || showOnScreens.contains(BasicConfigResponsive().screenDevice);
}

double getWithAdditionColumn(DataTableAdditionColumn additionColumn) {
  switch (additionColumn) {
    case DataTableAdditionColumn.none:
      return 0;
    case DataTableAdditionColumn.numbered:
      return 60;
    case DataTableAdditionColumn.checkbox:
      return 40;
  }
}
