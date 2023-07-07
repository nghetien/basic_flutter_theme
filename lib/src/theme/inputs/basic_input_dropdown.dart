part of 'inputs.dart';

class BasicInputDropdownItemModel<T> {
  const BasicInputDropdownItemModel({
    required this.value,
    this.keyValue,
    required this.label,
    this.child,
  });

  final T value;
  final String? keyValue;
  final String label;
  final Widget Function(T, String)? child;
}

class BasicInputDropdown<T> extends StatefulWidget {
  const BasicInputDropdown({
    Key? key,
    this.name,
    this.haveSearch = false,
    this.filterOption,
    required this.menuChildren,
    this.onSelected,
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
  })  : assert(
          !(haveSearch == true && filterOption == null),
          'If haveSearch is true, filterOption must not be null',
        ),
        super(key: key);

  final String? name;
  final bool haveSearch;
  final List<BasicInputDropdownItemModel<T>> Function(String, List<BasicInputDropdownItemModel<T>>)?
      filterOption;
  final List<BasicInputDropdownItemModel<T>> menuChildren;
  final Function(BasicInputDropdownItemModel<T>)? onSelected;
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
  final BasicInputDropdownItemModel<T>? initialValue;
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
  final ValueTransformer<BasicInputDropdownItemModel<T>?>? valueTransformer;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter? onSaved;
  final bool? isDense;
  final bool? filled;
  final Widget? prefixIcon;
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
  State<BasicInputDropdown<T>> createState() => BasicInputDropdownState<T>();
}

class BasicInputDropdownState<T> extends State<BasicInputDropdown<T>>
    with SingleTickerProviderStateMixin {
  final MenuController _menuController = MenuController();
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  late List<BasicInputDropdownItemModel<T>> _menuChildren;

  BasicInputDropdownItemModel<T>? _currentSelected;

  void _onFocusChange() {
    if (widget.haveSearch) {
      if (_focusNode.hasFocus) _menuController.open();
    } else {
      if (_focusNode.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
        _menuController.open();
      }
    }
    widget.onFocusChange?.call(_focusNode.hasFocus);
  }

  void _listenOnChangeInput() {
    if (widget.haveSearch) {
      if (_controller.text.isNotEmpty) {
        setState(() => _menuChildren = widget.filterOption!(_controller.text, widget.menuChildren));
      } else {
        setState(() => _menuChildren = widget.menuChildren);
      }
    }
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
    if(widget.initialValue != null) _currentSelected = widget.initialValue;
    _menuChildren = widget.menuChildren;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _controller = widget.controller ?? TextEditingController();
    if(widget.initialValue != null) _controller.text = widget.initialValue!.label;
    if (widget.haveSearch) _controller.addListener(_listenOnChangeInput);
  }

  @override
  void didUpdateWidget(BasicInputDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.menuChildren != oldWidget.menuChildren) {
      setState(() => _menuChildren = widget.menuChildren);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.haveSearch) _controller.removeListener(_listenOnChangeInput);
    _animationController.dispose();
    super.dispose();
  }

  void _setPopupIsOpen(bool value) {
    if (value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void resetCurrentData(String? value) {
    if (value == null || value.isEmpty) {
      _currentSelected = null;
      _controller.clear();
      setState(() {});
      return;
    }
    _currentSelected =
        _menuChildren.firstWhereOrNull((element) => element.value.toString() == value);
    _controller.text = _currentSelected?.label ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = widget.width ?? constraints.maxWidth;
        return MenuAnchor(
          onOpen: () => _setPopupIsOpen(true),
          onClose: () => _setPopupIsOpen(false),
          crossAxisUnconstrained: false,
          controller: _menuController,
          alignmentOffset: widget.offset ?? const Offset(0, 10),
          style: MenuStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                widget.minWidthPopup ?? width,
                widget.minHeightPopup ??
                    _menuChildren.length * BasicButtonSize.large.height + 11.scaleSize,
              ),
            ),
            maximumSize: MaterialStateProperty.all(
              Size(
                widget.maxWidthPopup ?? width,
                widget.maxHeightPopup ??
                    _menuChildren.length * BasicButtonSize.large.height + 11.scaleSize,
              ),
            ),
            visualDensity: VisualDensity.comfortable,
          ),
          menuChildren: _menuChildren.map(
            (item) {
              return BasicButton(
                width: double.infinity,
                size: BasicButtonSize.large,
                onPressed: () {
                  _currentSelected = item;
                  _controller.text = item.label;
                  widget.onSelected?.call(item);
                  _menuController.close();
                },
                alignment: Alignment.centerLeft,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                background: Colors.transparent,
                child: item.child != null ? item.child!(item.value, item.label) : Text(item.label),
              );
            },
          ).toList(),
          builder: (context, controller, child) {
            return BasicInput(
              name: widget.name,
              size: widget.size,
              width: widget.width,
              controller: _controller,
              focusNode: _focusNode,
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
              valueTransformer: (value) {
                if (_currentSelected == null) return widget.valueTransformer?.call(null);
                return widget.valueTransformer?.call(_currentSelected);
              },
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
