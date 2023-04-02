part of '../data_table.dart';

class DataTableOptionUI {
  const DataTableOptionUI({
    this.fixTableInAScreen = false,
    this.textAlign = TextAlign.left,
    this.customizeItemPerPage = 'Item per page',
    this.customizeFromToItemInPage,
    this.isShowSortFilter = false,
    this.customizeSortDesc = 'Sort Desc',
    this.customizeSortAsc = 'Sort Asc',
    this.paddingOfRowItem,
    this.heightOfRowItem,
    this.heightOfHeaderItem,
  });

  final bool fixTableInAScreen;
  final TextAlign textAlign;
  final String customizeItemPerPage;
  final String Function(int, int, int)? customizeFromToItemInPage;
  final bool isShowSortFilter;
  final String customizeSortDesc;
  final String customizeSortAsc;
  final EdgeInsets? paddingOfRowItem;
  final double? heightOfRowItem;
  final double? heightOfHeaderItem;
}
