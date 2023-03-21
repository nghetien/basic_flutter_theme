part of '../data_table.dart';

class DefaultDataTableWidget<T> extends StatefulWidget {
  const DefaultDataTableWidget({
    Key? key,
    required this.controller,
    this.sortDataVoid,
    required this.dataTableOptionUI,
    this.additionFilter = const {},
    this.topContent,
    this.bottomContent,
    this.showerMoreContentIntoRowWidget,
    required this.handleChangeData,
    this.onPressRowItem,
  }) : super(key: key);

  final DataTableController<T> controller;
  final SortDataVoid? sortDataVoid;
  final DataTableOptionUI dataTableOptionUI;
  final Map<String, List<PopupMenuItem<String>>> additionFilter;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final AsyncDataSource<T> handleChangeData;
  final Function(T)? onPressRowItem;

  @override
  State<DefaultDataTableWidget<T>> createState() => _DefaultDataTableWidgetState<T>();
}

class _DefaultDataTableWidgetState<T> extends State<DefaultDataTableWidget<T>> {
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
                if (widget.controller.haveFixedColumnsLeft)
                  SizedBox(
                    width: widget.controller.widthOfLeftColumns,
                    child: DataTableFixedColumnWidget<T>(
                      type: FixedColumn.left,
                      controller: widget.controller,
                      sortDataVoid: widget.sortDataVoid,
                      dataTableOptionUI: widget.dataTableOptionUI,
                      additionFilter: widget.additionFilter,
                      onPressRowItem: widget.onPressRowItem,
                    ),
                  ),
                Expanded(
                  child: wrapperHorizontalContent(
                    LayoutBuilder(builder: (_, constrains) {
                      widget.controller.setWidthOfColumnsContent(constrains.maxWidth);
                      widget.controller.calculateWidthOfAllColumnsContent();
                      return SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        controller: _horizontalScrollController,
                        child: SizedBox(
                          width: widget.controller.widthOfColumnsContent,
                          child: Column(
                            children: <Widget>[
                              DataTableHeaderWidget<T>(
                                tableColumns: widget.controller.tableColumnsContent,
                                controller: widget.controller,
                                sortDataVoid: widget.sortDataVoid,
                                dataTableOptionUI: widget.dataTableOptionUI,
                                additionFilter: widget.additionFilter,
                              ),
                              DataTableContentWidget<T>(
                                tableColumns: widget.controller.tableColumnsContent,
                                controller: widget.controller,
                                topContent: widget.topContent,
                                bottomContent: widget.bottomContent,
                                showerMoreContentRowWidget: widget.showerMoreContentIntoRowWidget,
                                onPressRowItem: widget.onPressRowItem,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (widget.controller.haveFixedColumnsRight)
                  SizedBox(
                    width: widget.controller.widthOfRightColumns,
                    child: DataTableFixedColumnWidget<T>(
                      type: FixedColumn.right,
                      controller: widget.controller,
                      sortDataVoid: widget.sortDataVoid,
                      dataTableOptionUI: widget.dataTableOptionUI,
                      additionFilter: widget.additionFilter,
                      onPressRowItem: widget.onPressRowItem,
                    ),
                  ),
              ],
            ),
            if (scrollHorizontalWidget != null) scrollHorizontalWidget,
            DataTablePaginationWidget(
              controller: widget.controller,
              handleChangeData: widget.handleChangeData,
              dataTableOptionUI: widget.dataTableOptionUI,
            ),
          ],
        ),
      ),
    );
  }
}
