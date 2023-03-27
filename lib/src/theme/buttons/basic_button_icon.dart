part of 'buttons.dart';

class BasicButtonIcon extends StatelessWidget {
  const BasicButtonIcon({
    Key? key,
    this.buttonSize,
    this.buttonType = BasicButtonType.none,
    required this.onPressed,
    this.text,
    this.iconData,
    this.icon,
    this.iconBeforeText = true,
    this.iconIsInEdge = false,
    this.width,
    this.height,
    this.padding,
    this.background,
    this.hoverColor,
    this.shadowColor = Colors.transparent,
    this.splashFactory,
    this.boxShadow,
    this.shape,
    this.textColor,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.maxLines = 4,
    this.alignment,
    this.mainAxisAlignment,
    this.spaceBetweenIconAndText,
    this.mainAxisSize,
  }) : super(key: key);

  final BasicButtonSize? buttonSize;
  final BasicButtonType buttonType;
  final VoidCallback onPressed;
  final String? text;
  final IconData? iconData;
  final Icon? icon;
  final bool iconBeforeText;
  final bool iconIsInEdge;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? background;
  final Color? hoverColor;
  final Color shadowColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final List<BoxShadow>? boxShadow;
  final OutlinedBorder? shape;
  final Color? textColor;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int maxLines;
  final AlignmentGeometry? alignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? spaceBetweenIconAndText;
  final MainAxisSize? mainAxisSize;

  @override
  Widget build(BuildContext context) {
    if (icon == null && iconData == null) {
      return BasicButton(
        key: key,
        buttonSize: buttonSize,
        buttonType: buttonType,
        onPressed: onPressed,
        width: width,
        height: height,
        padding: padding,
        background: background,
        hoverColor: hoverColor,
        shadowColor: shadowColor,
        splashFactory: splashFactory,
        boxShadow: boxShadow,
        shape: shape,
        textColor: textColor,
        textStyle: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        alignment: alignment,
      );
    }
    Widget? children;
    if (text == null) {
      children = _getIcon();
    } else {
      children = Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        children: [
          if (iconBeforeText)
            Padding(
              padding: EdgeInsets.only(
                right: spaceBetweenIconAndText ?? _getDefaultSpaceBetweenIconAndText(),
              ),
              child: _getIcon(),
            ),
          _textWidget(
            iconIsInEdge: iconIsInEdge,
            child: Text(
              text ?? '',
              textAlign: TextAlign.center,
              maxLines: maxLines,
              style: textStyle ??
                  BasicTextStyles.body.copyWith(
                    color: textColor ??
                        (buttonType.outlinedBorder == null
                            ? BasicAppColors.white
                            : BasicAppColors.black),
                    height: 0,
                  ),
            ),
          ),
          if (!iconBeforeText)
            Padding(
              padding: EdgeInsets.only(
                left: spaceBetweenIconAndText ?? _getDefaultSpaceBetweenIconAndText(),
              ),
              child: _getIcon(),
            ),
        ],
      );
    }
    return BasicButton(
      key: key,
      buttonSize: buttonSize,
      buttonType: buttonType,
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      background: background,
      hoverColor: hoverColor,
      shadowColor: shadowColor,
      splashFactory: splashFactory,
      boxShadow: boxShadow,
      shape: shape,
      textColor: textColor,
      textStyle: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      alignment: alignment,
      child: children,
    );
  }

  double _getDefaultSpaceBetweenIconAndText() {
    if (buttonSize == null) {
      return BasicPaddings.p8;
    } else if (buttonSize == BasicButtonSize.small) {
      return BasicPaddings.p4;
    } else {
      return BasicPaddings.p8;
    }
  }

  Widget _getIcon() {
    if (iconData != null) {
      return Icon(
        iconData,
        color: textColor ?? (buttonType == BasicButtonType.none ? null : BasicAppColors.white),
      );
    } else {
      return icon!;
    }
  }

  Widget _textWidget({
    required bool iconIsInEdge,
    required Widget child,
  }) =>
      iconIsInEdge ? Expanded(child: child) : Flexible(child: child);
}
