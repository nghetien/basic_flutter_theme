part of 'inputs.dart';

class BasicInputDropdownSelect<T> extends StatefulWidget {
  const BasicInputDropdownSelect({
    Key? key,
    required this.filterOption,
    required this.menuChildren,
    required this.onSelected,
    this.tagsAbleScroll = false,
    this.closeDropdownAfterSelect = true,
    this.hintTextSearch = 'Search',
    this.prefixIconSearch,
    this.backgroundColorSelected,
    this.iconSelected,
    this.offset,
    this.maxHeightPopup,
    this.minHeightPopup,
    this.maxWidthPopup,
    this.minWidthPopup,
    this.inputSize,
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

  final List<BasicInputDropdownItemModel<T>> Function(String, List<BasicInputDropdownItemModel<T>>)
      filterOption;
  final List<BasicInputDropdownItemModel<T>> menuChildren;
  final Function(T, List<T>) onSelected;
  final bool tagsAbleScroll;
  final bool closeDropdownAfterSelect;
  final String hintTextSearch;
  final Widget? prefixIconSearch;
  final Color? backgroundColorSelected;
  final Widget? iconSelected;
  final Offset? offset;
  final double? maxHeightPopup;
  final double? minHeightPopup;
  final double? maxWidthPopup;
  final double? minWidthPopup;
  final BasicInputSize? inputSize;
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
  State<BasicInputDropdownSelect<T>> createState() => _BasicInputDropdownSelectState<T>();
}

class _BasicInputDropdownSelectState<T> extends State<BasicInputDropdownSelect<T>>
    with SingleTickerProviderStateMixin {
  final MenuController _menuController = MenuController();
  late final FocusNode _focusNode;
  late final TextEditingController _searchController;
  final FocusNode _searchFocusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  late List<BasicInputDropdownItemModel<T>> _menuChildren;
  late List<BasicInputDropdownItemModel<T>> _menuChildrenSelected;
  late final ScrollController _scrollController;

  void _onFocusChange() {
    FocusManager.instance.primaryFocus?.unfocus();
    _menuController.open();
    if (!_searchFocusNode.hasPrimaryFocus) _searchFocusNode.requestFocus();
    widget.onFocusChange?.call(_focusNode.hasFocus);
  }

  void _listenOnChangeInput() {
    if (_searchController.text.isNotEmpty) {
      setState(
          () => _menuChildren = widget.filterOption(_searchController.text, widget.menuChildren));
    } else {
      setState(() => _menuChildren = widget.menuChildren);
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
    _menuChildren = widget.menuChildren;
    _menuChildrenSelected = [];
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _searchController = widget.controller ?? TextEditingController();
    _searchController.addListener(_listenOnChangeInput);
    if (widget.tagsAbleScroll) _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _searchController.removeListener(_listenOnChangeInput);
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
                    _menuChildren.length * BasicButtonSize.large.height +
                        24.scaleSize +
                        (widget.inputSize ?? BasicInputSize.large).height,
              ),
            ),
            maximumSize: MaterialStateProperty.all(
              Size(
                widget.maxWidthPopup ?? width,
                widget.maxHeightPopup ??
                    _menuChildren.length * BasicButtonSize.large.height +
                        24.scaleSize +
                        (widget.inputSize ?? BasicInputSize.large).height,
              ),
            ),
            visualDensity: VisualDensity.comfortable,
          ),
          menuChildren: [
            Padding(
              padding: EdgeInsets.all(BasicPaddings.p8).copyWith(top: BasicPaddings.p4),
              child: BasicInput(
                focusNode: _searchFocusNode,
                controller: _searchController,
                inputSize: widget.inputSize ?? BasicInputSize.large,
                prefixIcon: widget.prefixIconSearch ?? const Icon(Icons.search),
                hintText: widget.hintTextSearch,
              ),
            ),
            ..._menuChildren.map(
              (item) {
                final bool isSelected = _menuChildrenSelected.contains(item);
                return BasicButton(
                  width: double.infinity,
                  buttonSize: BasicButtonSize.large,
                  onPressed: () {
                    if (_menuChildrenSelected.contains(item)) {
                      _menuChildrenSelected.remove(item);
                    } else {
                      _menuChildrenSelected.add(item);
                    }
                    widget.onSelected.call(
                      item.value,
                      _menuChildrenSelected.map((e) => e.value).toList(),
                    );
                    if (widget.closeDropdownAfterSelect) _menuController.close();
                    setState(() {});
                  },
                  alignment: Alignment.centerLeft,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  background: isSelected
                      ? widget.backgroundColorSelected ?? BasicAppColors.greenOpacity01
                      : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      item.child != null
                          ? item.child!(item.value, item.label)
                          : Flexible(
                              child: Text(item.label),
                            ),
                      if (isSelected)
                        widget.iconSelected ??
                            const Icon(
                              Icons.check,
                              color: BasicAppColors.green,
                            )
                    ],
                  ),
                );
              },
            ).toList(),
          ],
          builder: (context, controller, child) {
            return BasicInput(
              inputSize: widget.inputSize,
              width: widget.width,
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
              prefixIcon: _getPrefixIcon(),
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

  Widget _getPrefixIcon() {
    final Widget prefixIcon = Padding(
      padding: EdgeInsets.all(BasicPaddings.p8),
      child: Wrap(
        runSpacing: BasicPaddings.p8,
        spacing: BasicPaddings.p8,
        children: _menuChildrenSelected.map(
          (item) {
            return BasicDynamicTag(
              textContent: item.label,
              whenClose: () {
                _menuChildrenSelected.remove(item);
                widget.onSelected.call(
                  item.value,
                  _menuChildrenSelected.map((e) => e.value).toList(),
                );
                setState(() {});
              },
            );
          },
        ).toList(),
      ),
    );
    if (widget.tagsAbleScroll) {
      return BasicWrapScrollHorizontal(
        controller: _scrollController,
        child: prefixIcon,
      );
    }
    return prefixIcon;
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
