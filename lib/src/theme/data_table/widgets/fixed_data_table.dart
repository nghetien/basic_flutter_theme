part of '../data_table.dart';

class FixedDataTableWidget<T> extends StatefulWidget {
  const FixedDataTableWidget({
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
  State<FixedDataTableWidget<T>> createState() => _FixedDataTableWidgetState<T>();
}

class _FixedDataTableWidgetState<T> extends State<FixedDataTableWidget<T>> {
  final ScrollController _verticalScrollController = ScrollController(),
      _horizontalScrollController = ScrollController(),
      _verticalFixedColumnLeftScrollController = ScrollController(),
      _verticalFixedColumnRightScrollController = ScrollController();

  final GlobalKey<BasicVerticalScrollState> _keyVerticalScroll =
      GlobalKey<BasicVerticalScrollState>();

  bool _isListening = false;

  void _listenVerticalScroll() {
    if (_isListening) return;
    _isListening = true;
    if (widget.controller.haveFixedColumnsLeft) {
      _verticalFixedColumnLeftScrollController.jumpTo(_verticalScrollController.offset);
    }
    if (widget.controller.haveFixedColumnsRight) {
      _verticalFixedColumnRightScrollController.jumpTo(_verticalScrollController.offset);
    }
    _isListening = false;
  }

  void _listenVerticalFixedColumnLeftScroll() {
    if (_isListening) return;
    _isListening = true;
    _verticalScrollController.jumpTo(_verticalFixedColumnLeftScrollController.offset);
    if (widget.controller.haveFixedColumnsRight) {
      _verticalFixedColumnRightScrollController
          .jumpTo(_verticalFixedColumnLeftScrollController.offset);
    }
    _isListening = false;
  }

  void _listenVerticalFixedColumnRightScroll() {
    if (_isListening) return;
    _isListening = true;
    _verticalScrollController.jumpTo(_verticalFixedColumnRightScrollController.offset);
    if (widget.controller.haveFixedColumnsLeft) {
      _verticalFixedColumnLeftScrollController
          .jumpTo(_verticalFixedColumnRightScrollController.offset);
    }
    _isListening = false;
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller.haveFixedColumnsLeft || widget.controller.haveFixedColumnsRight) {
      _verticalScrollController.addListener(_listenVerticalScroll);
    }
    if (widget.controller.haveFixedColumnsLeft) {
      _verticalFixedColumnLeftScrollController.addListener(_listenVerticalFixedColumnLeftScroll);
    }
    if (widget.controller.haveFixedColumnsRight) {
      _verticalFixedColumnRightScrollController.addListener(_listenVerticalFixedColumnRightScroll);
    }
  }

  @override
  void dispose() {
    if (widget.controller.haveFixedColumnsLeft || widget.controller.haveFixedColumnsRight) {
      _verticalScrollController.removeListener(_listenVerticalScroll);
    }
    if (widget.controller.haveFixedColumnsLeft) {
      _verticalFixedColumnLeftScrollController.removeListener(_listenVerticalFixedColumnLeftScroll);
    }
    if (widget.controller.haveFixedColumnsRight) {
      _verticalFixedColumnRightScrollController
          .removeListener(_listenVerticalFixedColumnRightScroll);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicVerticalScroll(
      key: _keyVerticalScroll,
      scrollController: _verticalScrollController,
      builder: (
        _,
        BasicVerticalScrollWrapperContent wrapperVerticalContent,
        Widget? scrollVerticalWidget,
      ) =>
          LayoutBuilder(
        builder: (_, constrainsSize) {
          return BasicHorizontalScroll(
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
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (widget.controller.haveFixedColumnsLeft)
                            SizedBox(
                              width: widget.controller.widthOfLeftColumns,
                              child: FixedColumnForFixedTable<T>(
                                type: FixedColumn.left,
                                controller: widget.controller,
                                verticalFixedColumnScrollController:
                                    _verticalFixedColumnLeftScrollController,
                                rowOption: widget.rowOption,
                                checkBoxOption: widget.checkBoxOption,
                                headerOption: widget.headerOption,
                              ),
                            ),
                          Expanded(
                            child: wrapperHorizontalContent(
                              LayoutBuilder(
                                builder: (_, constrains) {
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
                                            headerOption: widget.headerOption,
                                            checkBoxOption: widget.checkBoxOption,
                                          ),
                                          Expanded(
                                            child: wrapperVerticalContent(
                                              SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                controller: _verticalScrollController,
                                                child: DataTableContentWidget<T>(
                                                  tableColumns:
                                                      widget.controller.tableColumnsContent,
                                                  verticalScrollState:
                                                      _keyVerticalScroll.currentState,
                                                  controller: widget.controller,
                                                  topContent: widget.topContent,
                                                  bottomContent: widget.bottomContent,
                                                  showerMoreContentRowWidget:
                                                      widget.showerMoreContentIntoRowWidget,
                                                  headerIntoRowWidget: widget.headerIntoRowWidget,
                                                  checkBoxOption: widget.checkBoxOption,
                                                  rowOption: widget.rowOption,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (widget.controller.haveFixedColumnsRight)
                            SizedBox(
                              width: widget.controller.widthOfRightColumns,
                              child: FixedColumnForFixedTable<T>(
                                type: FixedColumn.right,
                                controller: widget.controller,
                                verticalFixedColumnScrollController:
                                    _verticalFixedColumnRightScrollController,
                                rowOption: widget.rowOption,
                                checkBoxOption: widget.checkBoxOption,
                                headerOption: widget.headerOption,
                              ),
                            ),
                        ],
                      ),
                      if (scrollVerticalWidget != null)
                        Positioned(
                          right: 0,
                          top: widget.headerOption.heightOfHeaderItem ??
                              DataTableHeaderWidget.defaultHeightHeader,
                          child: scrollVerticalWidget,
                        ),
                    ],
                  ),
                ),
                if (scrollHorizontalWidget != null) scrollHorizontalWidget,
                DataTablePaginationWidget<T>(
                  controller: widget.controller,
                  handleChangeData: widget.handleChangeData,
                  paginationOption: widget.paginationOption,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
