part of '../data_table.dart';

class DefaultDataTableWidget<T> extends StatelessWidget {
  DefaultDataTableWidget({
    Key? key,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    this.additionFilter = const {},
    required this.widthAllColumn,
    this.topContent,
    this.bottomContent,
    this.showerMoreContentIntoRowWidget,
    this.listItemsPerPage,
    required this.handleChangeData,
  }) : super(key: key);

  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final double widthAllColumn;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final List<int>? listItemsPerPage;
  final AsyncDataSource<T> handleChangeData;

  final ScrollController _horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double widthColumn = widthAllColumn;
    if (controller.haveFixedColumnsLeft && controller.widthOfLeftColumns != null) {
      widthColumn -= controller.widthOfLeftColumns! + 0.5;
    }
    if (controller.haveFixedColumnsRight && controller.widthOfRightColumns != null) {
      widthColumn -= controller.widthOfRightColumns! + 0.5;
    }
    return BasicHorizontalScroll(
      scrollController: _horizontalScrollController,
      builder: (
        _,
        BasicHorizontalScrollWrapperContent wrapperHorizontalContent,
        Widget? scrollHorizontalWidget,
      ) =>
          Column(
        children: [
          wrapperHorizontalContent(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (controller.haveFixedColumnsLeft)
                  DataTableFixedColumnWidget<T>(
                    type: FixedColumn.left,
                    controller: controller,
                    sortDataVoid: sortDataVoid,
                    dataTableOptionUI: dataTableOptionUI,
                    additionFilter: additionFilter,
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _horizontalScrollController,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: widthColumn,
                          child: DataTableHeaderWidget<T>(
                            tableColumns: controller.tableColumnsContent,
                            controller: controller,
                            sortDataVoid: sortDataVoid,
                            dataTableOptionUI: dataTableOptionUI,
                            additionFilter: additionFilter,
                          ),
                        ),
                        SizedBox(
                          width: widthColumn,
                          child: DataTableContentWidget<T>(
                            tableColumns: controller.tableColumnsContent,
                            controller: controller,
                            topContent: topContent,
                            bottomContent: bottomContent,
                            showerMoreContentRowWidget: showerMoreContentIntoRowWidget,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.haveFixedColumnsRight)
                  DataTableFixedColumnWidget<T>(
                    type: FixedColumn.right,
                    controller: controller,
                    sortDataVoid: sortDataVoid,
                    dataTableOptionUI: dataTableOptionUI,
                    additionFilter: additionFilter,
                  ),
              ],
            ),
          ),
          if (scrollHorizontalWidget != null) scrollHorizontalWidget,
          DataTablePaginationWidget(
            controller: controller,
            initListItemsPerPage: listItemsPerPage,
            handleChangeData: handleChangeData,
            dataTableOptionUI: dataTableOptionUI,
          ),
        ],
      ),
    );
  }
}
