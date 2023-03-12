import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

import '../scroll_config.dart';
import 'vertical_scroll_widget.dart';

typedef BasicVerticalScrollWrapperContent = Widget Function(Widget);

typedef BasicVerticalScrollBuilder = Widget Function(
  BuildContext context,
  BasicVerticalScrollWrapperContent child,
  Widget? scrollWidget,
);

class BasicVerticalScroll extends StatefulWidget {
  const BasicVerticalScroll({
    required this.scrollController,
    this.child,
    this.builder,
    this.scrollWidth = BasicScrollConfig.scrollWidthInVertical,
    this.scrollWidgetOnHover = BasicScrollConfig.scrollWidthInVerticalOnHover,
    this.ratioOfScroll,
    this.maxScroll,
    Key? key,
  })  : assert(
          !(child != null && builder != null),
          'You can only pass [child] or [builder], not both.',
        ),
        assert(
          !(child == null && builder == null),
          'You must pass either [child] or [builder].',
        ),
        super(key: key);

  final ScrollController scrollController;
  final Widget? child;
  final BasicVerticalScrollBuilder? builder;
  final double scrollWidth;
  final double scrollWidgetOnHover;
  final double? ratioOfScroll;
  final double? maxScroll;

  @override
  State<BasicVerticalScroll> createState() => BasicVerticalScrollState();
}

class BasicVerticalScrollState extends State<BasicVerticalScroll> {
  final _scrollGlobalKey = GlobalKey();
  late double _maxScroll;
  double _scrollHeight = 100;
  double _currentPosition = 0;
  bool _statusOfScrollBar = false;

  @override
  void initState() {
    _maxScroll = BasicSizeOfDevice.deviceHeight;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateScroll();
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(BasicVerticalScroll oldWidget) {
    if (oldWidget.maxScroll != widget.maxScroll && widget.maxScroll != null) {
      _maxScroll = widget.maxScroll ?? BasicSizeOfDevice.deviceHeight;
      calculateScroll();
    }
    super.didUpdateWidget(oldWidget);
  }

  void calculateScroll({double? maxHeight}) {
    _maxScroll = maxHeight ?? _maxScroll;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final maxScrollExtent = widget.scrollController.position.maxScrollExtent;
        if (maxScrollExtent == 0) {
          _statusOfScrollBar = false;
          return;
        }
        _statusOfScrollBar = true;
        final scrollControllerOffset = widget.scrollController.offset;
        _scrollHeight = (_maxScroll / (_maxScroll + maxScrollExtent)) * _maxScroll;
        _currentPosition =
            (scrollControllerOffset / maxScrollExtent) * (_maxScroll - _scrollHeight);
        if (_currentPosition >= _maxScroll - _scrollHeight) {
          _currentPosition = _maxScroll - _scrollHeight;
        }
        (_scrollGlobalKey.currentState as BasicVerticalScrollWidgetState?)
            ?.setMaxScroll(_maxScroll);
        (_scrollGlobalKey.currentState as BasicVerticalScrollWidgetState?)
            ?.setScrollHeight(_scrollHeight);
        (_scrollGlobalKey.currentState as BasicVerticalScrollWidgetState?)
            ?.setCurrentPosition(_currentPosition);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return Stack(
        children: [
          widget.maxScroll != null
              ? ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: widget.child!,
                )
              : LayoutBuilder(
                  builder: (_, BoxConstraints constraints) {
                    calculateScroll(maxHeight: constraints.maxHeight);
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      child: widget.child!,
                    );
                  },
                ),
          if (_statusOfScrollBar)
            Positioned(
              right: 0,
              child: BasicVerticalScrollWidget(
                key: _scrollGlobalKey,
                scrollController: widget.scrollController,
                maxScroll: _maxScroll,
                scrollHeight: _scrollHeight,
                initCurrentPosition: _currentPosition,
                scrollWidth: widget.scrollWidth,
                scrollWidthOnHover: widget.scrollWidgetOnHover,
                ratioOfScroll: widget.ratioOfScroll,
              ),
            ),
        ],
      );
    }
    return widget.builder!(
      context,
      (Widget content) => widget.maxScroll != null
          ? ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: content,
            )
          : LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                calculateScroll(maxHeight: constraints.maxHeight);
                return ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: content,
                );
              },
            ),
      _statusOfScrollBar
          ? BasicVerticalScrollWidget(
              key: _scrollGlobalKey,
              scrollController: widget.scrollController,
              maxScroll: _maxScroll,
              scrollHeight: _scrollHeight,
              initCurrentPosition: _currentPosition,
              scrollWidth: widget.scrollWidth,
              scrollWidthOnHover: widget.scrollWidgetOnHover,
              ratioOfScroll: widget.ratioOfScroll,
            )
          : null,
    );
  }
}
