part of 'inputs.dart';

class BasicInputDropdownItemModel<T>{
  const BasicInputDropdownItemModel({
    required this.value,
    required this.child,
  });

  final T value;
  final Widget child;
}

class BasicInputDropdown<T> extends StatefulWidget {
  const BasicInputDropdown({
    Key? key,
    this.autoOpenDropdown = true,
    required this.menuChildren,
    required this.onSelected,
    this.offset,
    this.maxHeightPopup,
    this.minHeightPopup,
    this.maxWidthPopup,
    this.minWidthPopup,
    this.inputType,
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
    this.enabled,
    this.obscureText = false,
    this.scrollPadding,
    this.cursorColor,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
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

  final bool autoOpenDropdown;
  final List<BasicInputDropdownItemModel<T>> menuChildren;
  final Function(T)? onSelected;
  final Offset? offset;
  final double? maxHeightPopup;
  final double? minHeightPopup;
  final double? maxWidthPopup;
  final double? minWidthPopup;
  final BasicInputType? inputType;
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
  final bool? enabled;
  final bool obscureText;
  final EdgeInsets? scrollPadding;
  final Color? cursorColor;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
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
  State<BasicInputDropdown<T>> createState() => _BasicInputDropdownState<T>();
}

class _BasicInputDropdownState<T> extends State<BasicInputDropdown<T>>
    with SingleTickerProviderStateMixin {
  final MenuController _menuController = MenuController();
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  void _onFocusChange() {
    if (widget.autoOpenDropdown) {
      if (_focusNode.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
        _menuController.open();
      }
    }
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
                    widget.menuChildren.length * BasicButtonType.large.height + 11.scaleSize,
              ),
            ),
            maximumSize: MaterialStateProperty.all(
              Size(
                widget.maxWidthPopup ?? width,
                widget.maxHeightPopup ??
                    widget.menuChildren.length * BasicButtonType.large.height + 11.scaleSize,
              ),
            ),
            visualDensity: VisualDensity.comfortable,
          ),
          menuChildren: widget.menuChildren.map(
            (item) {
              return BasicButton(
                width: double.infinity,
                buttonType: BasicButtonType.large,
                onPressed: () {
                  widget.onSelected?.call(item.value);
                  _menuController.close();
                },
                alignment: Alignment.centerLeft,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                background: Colors.transparent,
                child: item.child,
              );
            },
          ).toList(),
          builder: (context, controller, child) {
            return BasicInput(
              inputType: widget.inputType,
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
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
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
          size: BasicIconSizes().s24,
        ),
      ),
    );
  }
}
