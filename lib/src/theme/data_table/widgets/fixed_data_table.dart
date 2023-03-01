part of '../data_table.dart';

class FixedDataTableWidget<T> extends StatefulWidget {
  const FixedDataTableWidget({
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
    _verticalFixedColumnLeftScrollController.jumpTo(_verticalScrollController.offset);
    _verticalFixedColumnRightScrollController.jumpTo(_verticalScrollController.offset);
    _isListening = false;
  }

  void _listenVerticalFixedColumnLeftScroll() {
    if (_isListening) return;
    _isListening = true;
    _verticalScrollController.jumpTo(_verticalFixedColumnLeftScrollController.offset);
    _verticalFixedColumnRightScrollController
        .jumpTo(_verticalFixedColumnLeftScrollController.offset);
    _isListening = false;
  }

  void _listenVerticalFixedColumnRightScroll() {
    if (_isListening) return;
    _isListening = true;
    _verticalScrollController.jumpTo(_verticalFixedColumnRightScrollController.offset);
    _verticalFixedColumnLeftScrollController
        .jumpTo(_verticalFixedColumnRightScrollController.offset);
    _isListening = false;
  }

  @override
  void initState() {
    super.initState();
    _verticalScrollController.addListener(_listenVerticalScroll);
    _verticalFixedColumnLeftScrollController.addListener(_listenVerticalFixedColumnLeftScroll);
    _verticalFixedColumnRightScrollController.addListener(_listenVerticalFixedColumnRightScroll);
  }

  @override
  void dispose() {
    _verticalScrollController.removeListener(_listenVerticalScroll);
    _verticalFixedColumnLeftScrollController.removeListener(_listenVerticalFixedColumnLeftScroll);
    _verticalFixedColumnRightScrollController.removeListener(_listenVerticalFixedColumnRightScroll);
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    _verticalFixedColumnLeftScrollController.dispose();
    _verticalFixedColumnRightScrollController.dispose();
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
          BasicHorizontalScroll(
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
                  wrapperHorizontalContent(
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (widget.controller.haveFixedColumnsLeft)
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: BasicAppColors.greyOpacity04,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                DataTableFixedColumnHeaderWidget<T>(
                                  type: FixedColumn.left,
                                  controller: widget.controller,
                                  sortDataVoid: widget.sortDataVoid,
                                  dataTableOptionUI: widget.dataTableOptionUI,
                                  additionFilter: widget.additionFilter,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: _verticalFixedColumnLeftScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: DataTableFixedColumnContentWidget<T>(
                                      type: FixedColumn.left,
                                      controller: widget.controller,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: _horizontalScrollController,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: widget.widthAllColumn,
                                  child: DataTableHeaderWidget<T>(
                                    tableColumns: widget.controller.tableColumnsContent,
                                    controller: widget.controller,
                                    sortDataVoid: widget.sortDataVoid,
                                    dataTableOptionUI: widget.dataTableOptionUI,
                                    additionFilter: widget.additionFilter,
                                  ),
                                ),
                                Expanded(
                                  child: wrapperVerticalContent(
                                    SingleChildScrollView(
                                      padding: const EdgeInsets.only(
                                        right: BasicScrollConfig.scrollWidthInVerticalOnHover,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      controller: _verticalScrollController,
                                      child: SizedBox(
                                        width: widget.widthAllColumn -
                                            BasicScrollConfig.scrollWidthInVerticalOnHover,
                                        child: DataTableContentWidget<T>(
                                          tableColumns: widget.controller.tableColumnsContent,
                                          verticalScrollState: _keyVerticalScroll.currentState,
                                          controller: widget.controller,
                                          topContent: widget.topContent,
                                          bottomContent: widget.bottomContent,
                                          showerMoreContentRowWidget:
                                              widget.showerMoreContentIntoRowWidget,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (widget.controller.haveFixedColumnsRight)
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: BasicAppColors.greyOpacity04,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                DataTableFixedColumnHeaderWidget<T>(
                                  type: FixedColumn.right,
                                  controller: widget.controller,
                                  sortDataVoid: widget.sortDataVoid,
                                  dataTableOptionUI: widget.dataTableOptionUI,
                                  additionFilter: widget.additionFilter,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: _verticalFixedColumnRightScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: DataTableFixedColumnContentWidget<T>(
                                      type: FixedColumn.right,
                                      controller: widget.controller,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (scrollVerticalWidget != null)
                    Positioned(
                      right: 0,
                      top: DataTableHeaderWidget.defaultHeightHeader,
                      child: scrollVerticalWidget,
                    ),
                ],
              ),
            ),
            if (scrollHorizontalWidget != null) scrollHorizontalWidget,
            DataTablePaginationWidget(
              controller: widget.controller,
              initListItemsPerPage: widget.listItemsPerPage,
              handleChangeData: widget.handleChangeData,
              dataTableOptionUI: widget.dataTableOptionUI,
            ),
          ],
        ),
      ),
    );
  }
}
