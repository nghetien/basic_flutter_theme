part of '../data_table.dart';

class DataTablePagination {
  static const int defaultItemsPerPage = 20;
  static const List<int> defaultListItemsPerPage = [20, 30, 50];

  static int get getNumberNextPage{
    switch (BasicConfigResponsive().screenDevice) {
      case BasicScreenDevice.mobile:
        return 1;
      case BasicScreenDevice.tablet:
        return 3;
      case BasicScreenDevice.desktop:
        return 4;
    }
  }

  DataTablePagination({
    int? pageNumber,
    int? itemsPerPage,
    List<int>? listItemsPerPage,
    int? numberNextPage,
  })  : pageNumber = pageNumber ?? 1,
        itemsPerPage = itemsPerPage ?? defaultItemsPerPage,
        listItemsPerPage = listItemsPerPage ?? defaultListItemsPerPage,
        numberNextPage = numberNextPage ?? getNumberNextPage;

  /// init data
  int pageNumber;
  int itemsPerPage;
  List<int> listItemsPerPage;
  int numberNextPage;

  /// handle data
  int currentPage = 1;
  int excessStart = 0;
  int excessEnd = 0;
  int startPage = 0;
  int endPage = 0;

  void setListItemsPerPage(List<int>? listItemsPerPage) {
    if (listItemsPerPage != null && listItemsPerPage.isNotEmpty) {
      listItemsPerPage = listItemsPerPage;
    }
  }

  /// logic
  void calculatePagination() {
    numberNextPage = getNumberNextPage;
    excessStart = currentPage - numberNextPage <= 0 ? numberNextPage - (currentPage - 1) : 0;
    excessEnd = currentPage + numberNextPage >= pageNumber
        ? numberNextPage - (pageNumber - currentPage)
        : 0;
    startPage = currentPage - numberNextPage <= 0 ? 1 : currentPage - numberNextPage - excessStart;
    endPage = currentPage + numberNextPage >= pageNumber
        ? pageNumber
        : currentPage + numberNextPage + excessEnd;
  }
}
