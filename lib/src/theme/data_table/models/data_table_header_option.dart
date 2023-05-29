part of '../data_table.dart';

class DataTableHeaderOption {
  const DataTableHeaderOption({
    this.isShowSortFilter = false,
    this.customizeSortDesc = 'Sort Desc',
    this.customizeSortAsc = 'Sort Asc',
    this.heightOfHeaderItem,
    this.sortDataVoid,
    this.additionFilter = const {},
    this.borderRadius,
  });

  final bool isShowSortFilter;
  final String customizeSortDesc;
  final String customizeSortAsc;
  final double? heightOfHeaderItem;
  final SortDataVoid? sortDataVoid;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final Radius? borderRadius;
}
