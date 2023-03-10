part of 'buttons.dart';

class BasicButtonType {
  const BasicButtonType(double height) : _height = height;
  final double _height;

  double get height => _height;

  static const BasicButtonType large = BasicButtonType(42);
  static const BasicButtonType medium = BasicButtonType(35);
  static const BasicButtonType small = BasicButtonType(26);
}

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    this.buttonType,
    this.isFullColor = false,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.background,
    this.hoverColor,
    this.shadowColor = Colors.transparent,
    this.boxShadow,
    this.splashFactory,
    this.shape,
    this.textColor,
    this.fontSize,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.maxLines = 4,
    this.alignment,
  }) : super(key: key);

  final BasicButtonType? buttonType;
  final bool isFullColor;
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
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
  final double? fontSize;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final int maxLines;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: height ?? buttonType?.height,
        width: width,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            alignment: alignment,
            backgroundColor: background ?? (isFullColor ? BasicAppColors().primary : null),
            shape: shape,
            padding: EdgeInsets.zero,
            shadowColor: shadowColor,
            elevation: 0,
            minimumSize: Size.zero,
            foregroundColor: hoverColor,
            splashFactory: splashFactory,
          ),
          child: Container(
            padding: padding ??
                (buttonType == null
                    ? EdgeInsets.symmetric(
                        horizontal: BasicPaddings().p14,
                        vertical: BasicPaddings().p8,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: BasicPaddings().p14,
                        vertical: 0,
                      )),
            child: child ??
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  maxLines: maxLines,
                  style: textStyle ??
                      BasicTextStyles.body.copyWith(
                        color: textColor ??
                            (isFullColor
                                ? BasicAppColors.white
                                : context.theme.textTheme.bodyMedium?.color),
                        height: 0,
                        fontSize: fontSize,
                      ),
                ),
          ),
        ),
      );
}
