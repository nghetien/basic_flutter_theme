part of '../data_table.dart';

class DataTableOptionUI {
  const DataTableOptionUI({
    this.fixTableInAScreen = false,
    this.textAlign = TextAlign.left,
    this.customizeItemPerPage = 'Item per page',
    this.customizeFromToItemInPage,
    this.customizeSortDesc = 'Sort Desc',
    this.customizeSortAsc = 'Sort Asc',
  });

  final bool fixTableInAScreen;
  final TextAlign textAlign;
  final String customizeItemPerPage;
  final String Function(int, int, int)? customizeFromToItemInPage;
  final String customizeSortDesc;
  final String customizeSortAsc;
}
