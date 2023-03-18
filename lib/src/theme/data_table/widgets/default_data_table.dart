part of '../data_table.dart';

class DefaultDataTableWidget<T> extends StatelessWidget {
  DefaultDataTableWidget({
    Key? key,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    this.additionFilter = const {},
    this.topContent,
    this.bottomContent,
    this.showerMoreContentIntoRowWidget,
    required this.handleChangeData,
  }) : super(key: key);

  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final AsyncDataSource<T> handleChangeData;

  final ScrollController _horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrainsSize) => BasicHorizontalScroll(
        maxScroll: constrainsSize.maxWidth,
        scrollController: _horizontalScrollController,
        builder: (
          _,
          BasicHorizontalScrollWrapperContent wrapperHorizontalContent,
          Widget? scrollHorizontalWidget,
        ) =>
            Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (controller.haveFixedColumnsLeft)
                  SizedBox(
                    width: controller.widthOfLeftColumns,
                    child: DataTableFixedColumnWidget<T>(
                      type: FixedColumn.left,
                      controller: controller,
                      sortDataVoid: sortDataVoid,
                      dataTableOptionUI: dataTableOptionUI,
                      additionFilter: additionFilter,
                    ),
                  ),
                Expanded(
                  child: wrapperHorizontalContent(
                    LayoutBuilder(builder: (_, constrains) {
                      controller.setWidthOfColumnsContent(constrains.maxWidth);
                      controller.calculateWidthOfAllColumnsContent();
                      return SizedBox(
                        width: controller.widthOfColumnsContent,
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          controller: _horizontalScrollController,
                          child: Column(
                            children: <Widget>[
                              DataTableHeaderWidget<T>(
                                tableColumns: controller.tableColumnsContent,
                                controller: controller,
                                sortDataVoid: sortDataVoid,
                                dataTableOptionUI: dataTableOptionUI,
                                additionFilter: additionFilter,
                              ),
                              DataTableContentWidget<T>(
                                tableColumns: controller.tableColumnsContent,
                                controller: controller,
                                topContent: topContent,
                                bottomContent: bottomContent,
                                showerMoreContentRowWidget: showerMoreContentIntoRowWidget,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (controller.haveFixedColumnsRight)
                  SizedBox(
                    width: controller.widthOfRightColumns,
                    child: DataTableFixedColumnWidget<T>(
                      type: FixedColumn.right,
                      controller: controller,
                      sortDataVoid: sortDataVoid,
                      dataTableOptionUI: dataTableOptionUI,
                      additionFilter: additionFilter,
                    ),
                  ),
              ],
            ),
            if (scrollHorizontalWidget != null) scrollHorizontalWidget,
            DataTablePaginationWidget(
              controller: controller,
              handleChangeData: handleChangeData,
              dataTableOptionUI: dataTableOptionUI,
            ),
          ],
        ),
      ),
    );
  }
}
