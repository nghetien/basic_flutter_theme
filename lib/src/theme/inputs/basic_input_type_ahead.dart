part of 'inputs.dart';

class BasicInputTypeAhead<T> extends StatefulWidget {
  const BasicInputTypeAhead({
    Key? key,
    this.name,
    required this.menuChildren,
    required this.maxMenuChildren,
    required this.onSelected,
    required this.onScrollNotification,
    this.scrollController,
    this.offset,
    this.maxHeightPopup,
    this.minHeightPopup,
    this.maxWidthPopup,
    this.minWidthPopup,
    this.size,
    this.width,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.onFocusChange,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.obscureText = false,
    this.scrollPadding,
    this.cursorColor,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.valueTransformer,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSaved,
    this.isDense,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.hoverColor,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.floatingLabelBehavior,
    this.hintText,
    this.hintStyle,
    this.errorText,
    this.errorMaxLines,
    this.errorStyle,
  }) : super(key: key);

  final String? name;
  final List<BasicInputDropdownItemModel<T>> menuChildren;
  final int maxMenuChildren;
  final Function(T) onSelected;
  final Function(ScrollNotification) onScrollNotification;
  final ScrollController? scrollController;
  final Offset? offset;
  final double? maxHeightPopup;
  final double? minHeightPopup;
  final double? maxWidthPopup;
  final double? minWidthPopup;
  final BasicInputSize? size;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(bool)? onFocusChange;
  final String? initialValue;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final bool obscureText;
  final EdgeInsets? scrollPadding;
  final Color? cursorColor;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueTransformer<String?>? valueTransformer;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter? onSaved;
  final bool? isDense;
  final bool? filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final Color? hoverColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final int? errorMaxLines;
  final TextStyle? errorStyle;

  @override
  State<BasicInputTypeAhead<T>> createState() => _BasicInputTypeAheadState<T>();
}

class _BasicInputTypeAheadState<T> extends State<BasicInputTypeAhead<T>>
    with SingleTickerProviderStateMixin {
  final MenuController _menuController = MenuController();
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  late List<BasicInputDropdownItemModel<T>> _menuChildren;
  late double _widthPopupMenu;
  late int _maxMenuChildren;

  void _onFocusChange() {
    widget.onFocusChange?.call(_focusNode.hasFocus);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _controller = widget.controller ?? TextEditingController();
    _menuChildren = widget.menuChildren;
    _maxMenuChildren = widget.maxMenuChildren;
  }

  @override
  void didUpdateWidget(covariant BasicInputTypeAhead<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.menuChildren != widget.menuChildren) {
      _menuChildren = widget.menuChildren;
    }
    if (oldWidget.maxMenuChildren != widget.maxMenuChildren) {
      _maxMenuChildren = widget.maxMenuChildren;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _setPopupIsOpen(bool value) {
    if (value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        _widthPopupMenu = widget.width ?? constraints.maxWidth;
        return MenuAnchor(
          onOpen: () => _setPopupIsOpen(true),
          onClose: () => _setPopupIsOpen(false),
          crossAxisUnconstrained: false,
          controller: _menuController,
          alignmentOffset: widget.offset ?? const Offset(0, 10),
          style: const MenuStyle(visualDensity: VisualDensity.comfortable),
          menuChildren: _generateMenuChildren(),
          builder: (context, controller, child) {
            return BasicInput(
              name: widget.name,
              size: widget.size,
              width: widget.width,
              controller: _controller,
              focusNode: _focusNode,
              initialValue: widget.initialValue,
              textAlign: widget.textAlign,
              textAlignVertical: widget.textAlignVertical,
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              cursorColor: widget.cursorColor,
              autoValidateMode: widget.autoValidateMode,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
              valueTransformer: widget.valueTransformer,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onSaved: widget.onSaved,
              isDense: widget.isDense,
              filled: widget.filled,
              prefixIcon: widget.prefixIcon,
              suffixIcon: _getSuffixIcon(),
              contentPadding: widget.contentPadding,
              focusedBorder: widget.focusedBorder,
              enabledBorder: widget.enabledBorder,
              disabledBorder: widget.disabledBorder,
              errorBorder: widget.errorBorder,
              focusedErrorBorder: widget.focusedErrorBorder,
              fillColor: widget.fillColor,
              hoverColor: widget.hoverColor,
              labelText: widget.labelText,
              labelStyle: widget.labelStyle,
              floatingLabelStyle: widget.floatingLabelStyle,
              floatingLabelBehavior: widget.floatingLabelBehavior,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              errorText: widget.errorText,
              errorMaxLines: widget.errorMaxLines,
              errorStyle: widget.errorStyle,
            );
          },
        );
      },
    );
  }

  BoxConstraints _getBoxConstraints() {
    final double defaultHeight =
        (_menuChildren.length + (_menuChildren.length < widget.maxMenuChildren ? 1 : 0)) *
            BasicButtonSize.large.height;
    double minHeight = widget.minHeightPopup ?? defaultHeight;
    double? maxHeight = widget.maxHeightPopup;
    double minWidth = widget.minWidthPopup ?? _widthPopupMenu;
    double? maxWidth = widget.maxWidthPopup;
    if (maxHeight != null && maxHeight < minHeight) minHeight = maxHeight;
    maxHeight ??= minHeight;
    if (maxWidth != null && maxWidth < minWidth) minWidth = maxWidth;
    maxWidth ??= minWidth;
    return BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }

  List<Widget> _generateMenuChildren() {
    final menuChildren = <Widget>[];
    for (final item in _menuChildren) {
      menuChildren.add(
        BasicButton(
          width: double.infinity,
          size: BasicButtonSize.large,
          onPressed: () {
            widget.onSelected.call(item.value);
            _menuController.close();
          },
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          background: Colors.transparent,
          child: item.child != null ? item.child!(item.value, item.label) : Text(item.label),
        ),
      );
    }
    if (_menuChildren.length < _maxMenuChildren) {
      // add loading
      menuChildren.add(
        Container(
          alignment: Alignment.center,
          height: BasicButtonSize.large.height,
          child: Container(
            height: BasicButtonSize.large.height - 10,
            width: BasicButtonSize.large.height - 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      );
    }
    return [
      Container(
        constraints: _getBoxConstraints(),
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
              widget.onScrollNotification.call(scrollNotification);
            }
            return false;
          },
          child: SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: menuChildren,
            ),
          ),
        ),
      ),
    ];
  }

  Widget _getSuffixIcon() {
    return InkWell(
      onTap: () {
        if (_menuController.isOpen) {
          _menuController.close();
        } else {
          _menuController.open();
        }
      },
      child: RotationTransition(
        turns: _rotateAnimation,
        child: Icon(
          Icons.expand_more_rounded,
          size: BasicIconSizes.s24,
        ),
      ),
    );
  }
}
