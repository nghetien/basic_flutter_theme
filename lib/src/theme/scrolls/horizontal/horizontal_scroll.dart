import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:flutter/material.dart';

import '../scroll_config.dart';
import 'horizontal_scroll_widget.dart';

typedef BasicHorizontalScrollWrapperContent = Widget Function(Widget);

typedef BasicHorizontalScrollBuilder = Widget Function(
  BuildContext context,
  BasicHorizontalScrollWrapperContent child,
  Widget? scrollWidget,
);

class BasicHorizontalScroll extends StatefulWidget {
  const BasicHorizontalScroll({
    required this.scrollController,
    this.child,
    this.builder,
    this.scrollHeight = BasicScrollConfig.scrollHeightInHorizontal,
    this.scrollHeightOnHover = BasicScrollConfig.scrollHeightInHorizontalOnHover,
    this.ratioOfScroll,
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
  final BasicHorizontalScrollBuilder? builder;
  final double scrollHeight;
  final double scrollHeightOnHover;
  final double? ratioOfScroll;

  @override
  State<BasicHorizontalScroll> createState() => CustomHorizontalState();
}

class CustomHorizontalState extends State<BasicHorizontalScroll> {
  final _scrollGlobalKey = GlobalKey();
  late double _maxScroll;
  double _scrollWidth = 100;
  double _currentPosition = 0;
  bool _statusOfScrollBar = false;

  @override
  void initState() {
    _maxScroll = BasicSizeOfDevice.deviceWidth;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateScroll();
      setState(() {});
    });
    super.initState();
  }

  void calculateScroll({double? maxWidth}) {
    _maxScroll = maxWidth ?? _maxScroll;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final maxScrollExtent = widget.scrollController.position.maxScrollExtent;
        if (maxScrollExtent == 0) {
          _statusOfScrollBar = false;
          return;
        }
        _statusOfScrollBar = true;
        final scrollControllerOffset = widget.scrollController.offset;
        _scrollWidth = (_maxScroll / (_maxScroll + maxScrollExtent)) * _maxScroll;
        _currentPosition = (scrollControllerOffset / maxScrollExtent) * (_maxScroll - _scrollWidth);
        if (_currentPosition >= _maxScroll - _scrollWidth) {
          _currentPosition = _maxScroll - _scrollWidth;
        }
        (_scrollGlobalKey.currentState as BasicHorizontalScrollWidgetState?)
            ?.setMaxScroll(_maxScroll);
        (_scrollGlobalKey.currentState as BasicHorizontalScrollWidgetState?)
            ?.setScrollWidth(_scrollWidth);
        (_scrollGlobalKey.currentState as BasicHorizontalScrollWidgetState?)
            ?.setCurrentPosition(_currentPosition);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return Stack(
        children: [
          LayoutBuilder(builder: (_, BoxConstraints constraints) {
            calculateScroll(maxWidth: constraints.maxWidth);
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: widget.child!,
            );
          }),
          if (_statusOfScrollBar)
            Positioned(
              bottom: 0,
              child: BasicHorizontalScrollWidget(
                key: _scrollGlobalKey,
                scrollController: widget.scrollController,
                maxScroll: _maxScroll,
                scrollWidth: _scrollWidth,
                initCurrentPosition: _currentPosition,
                scrollHeight: widget.scrollHeight,
                scrollHeightOnHover: widget.scrollHeightOnHover,
                ratioOfScroll: widget.ratioOfScroll,
              ),
            ),
        ],
      );
    }
    return widget.builder!(
      context,
      (Widget content) => LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          calculateScroll(maxWidth: constraints.maxWidth);
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: content,
          );
        },
      ),
      _statusOfScrollBar
          ? BasicHorizontalScrollWidget(
              key: _scrollGlobalKey,
              scrollController: widget.scrollController,
              maxScroll: _maxScroll,
              scrollWidth: _scrollWidth,
              initCurrentPosition: _currentPosition,
              scrollHeight: widget.scrollHeight,
              scrollHeightOnHover: widget.scrollHeightOnHover,
              ratioOfScroll: widget.ratioOfScroll,
            )
          : null,
    );
  }
}
