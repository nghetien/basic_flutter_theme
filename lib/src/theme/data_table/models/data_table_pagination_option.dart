part of '../data_table.dart';

class DataTablePaginationOption {
  const DataTablePaginationOption({
    this.customizeItemPerPage = 'Item per page',
    this.customizeFromToItemInPage,
    this.isShowPagination = true,
  });

  final String customizeItemPerPage;
  final String Function(int, int, int)? customizeFromToItemInPage;
  final bool isShowPagination;
}
