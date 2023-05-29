part of '../data_table.dart';

class DefaultDataTableWidget<T> extends StatefulWidget {
  const DefaultDataTableWidget({
    Key? key,
    required this.controller,
    this.topContent,
    this.bottomContent,
    this.showerMoreContentIntoRowWidget,
    this.headerIntoRowWidget,
    required this.handleChangeData,
    required this.headerOption,
    required this.rowOption,
    required this.columnOption,
    required this.paginationOption,
    required this.checkBoxOption,
  }) : super(key: key);

  final DataTableController<T> controller;
  final OptionContentTable? topContent;
  final OptionContentTable? bottomContent;
  final ShowerMoreContentIntoRowWidget<T>? showerMoreContentIntoRowWidget;
  final HeaderIntoRowWidget<T>? headerIntoRowWidget;
  final AsyncDataSource<T> handleChangeData;
  final DataTableHeaderOption headerOption;
  final DataTableRowOption<T> rowOption;
  final DataTableColumnOption columnOption;
  final DataTablePaginationOption paginationOption;
  final DataTableCheckBoxOption<T> checkBoxOption;

  @override
  State<DefaultDataTableWidget<T>> createState() => _DefaultDataTableWidgetState<T>();
}

class _DefaultDataTableWidgetState<T> extends State<DefaultDataTableWidget<T>> {
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrainsSize) => BasicHorizontalScroll(
        scrollHeight: 10,
        scrollHeightOnHover: 13,
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
                      headerOption: widget.headerOption,
                      checkBoxOption: widget.checkBoxOption,
                      rowOption: widget.rowOption,
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
                                checkBoxOption: widget.checkBoxOption,
                                headerOption: widget.headerOption,
                              ),
                              DataTableContentWidget<T>(
                                tableColumns: widget.controller.tableColumnsContent,
                                controller: widget.controller,
                                topContent: widget.topContent,
                                bottomContent: widget.bottomContent,
                                showerMoreContentRowWidget: widget.showerMoreContentIntoRowWidget,
                                headerIntoRowWidget: widget.headerIntoRowWidget,
                                checkBoxOption: widget.checkBoxOption,
                                rowOption: widget.rowOption,
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
                      rowOption: widget.rowOption,
                      checkBoxOption: widget.checkBoxOption,
                      headerOption: widget.headerOption,
                    ),
                  ),
              ],
            ),
            if (scrollHorizontalWidget != null) scrollHorizontalWidget,
            if (widget.paginationOption.isShowPagination ||
                widget.paginationOption.enableItemPerPage)
              DataTablePaginationWidget<T>(
                controller: widget.controller,
                handleChangeData: widget.handleChangeData,
                paginationOption: widget.paginationOption,
              ),
          ],
        ),
      ),
    );
  }
}
