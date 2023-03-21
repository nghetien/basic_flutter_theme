part of 'buttons.dart';

class BasicButtonSize {
  const BasicButtonSize(double height) : _height = height;
  final double _height;

  double get height => _height;

  static const BasicButtonSize large = BasicButtonSize(42);
  static const BasicButtonSize medium = BasicButtonSize(35);
  static const BasicButtonSize small = BasicButtonSize(26);
}

class BasicButtonType {
  const BasicButtonType({
    Color? color,
    OutlinedBorder? outlinedBorder,
  })  : _color = color,
        _outlinedBorder = outlinedBorder;

  final Color? _color;
  final OutlinedBorder? _outlinedBorder;

  Color? get color => _color;

  OutlinedBorder? get outlinedBorder => _outlinedBorder;

  static final BasicButtonType primary = BasicButtonType(
    color: BasicAppColors.primary,
    outlinedBorder: null,
  );
  static final BasicButtonType outline = BasicButtonType(
    color: Colors.transparent,
    outlinedBorder: BeveledRectangleBorder(
      side: BorderSide(
        color: BasicAppColors.primary,
        width: BasicBorders.mainBorders,
      ),
      borderRadius: BasicCorners.mainCornerBorder,
    ),
  );
  static const BasicButtonType danger = BasicButtonType(
    color: BasicAppColors.red,
    outlinedBorder: null,
  );
  static const BasicButtonType warning = BasicButtonType(
    color: BasicAppColors.yellow,
    outlinedBorder: null,
  );
  static const BasicButtonType success = BasicButtonType(
    color: BasicAppColors.green,
    outlinedBorder: null,
  );
  static const BasicButtonType info = BasicButtonType(
    color: BasicAppColors.blueLight,
    outlinedBorder: null,
  );
  static const BasicButtonType none = BasicButtonType(
    color: null,
    outlinedBorder: null,
  );
}

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    this.buttonSize,
    this.buttonType = BasicButtonType.none,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.background,
    this.hoverColor,
    this.shadowColor = Colors.transparent,
    this.elevation,
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

  final BasicButtonSize? buttonSize;
  final BasicButtonType buttonType;
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? background;
  final Color? hoverColor;
  final Color shadowColor;
  final double? elevation;
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
        height: height ?? buttonSize?.height,
        width: width,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            alignment: alignment,
            backgroundColor: background ?? buttonType.color,
            shape: shape,
            padding: EdgeInsets.zero,
            shadowColor: shadowColor,
            elevation: elevation ?? 0,
            minimumSize: Size.zero,
            foregroundColor: hoverColor,
            splashFactory: splashFactory,
          ),
          child: Container(
            padding: padding ??
                (buttonSize == null
                    ? EdgeInsets.symmetric(
                        horizontal: BasicPaddings.mainPadding,
                        vertical: BasicPaddings.p8,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: BasicPaddings.mainPadding,
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
                            (buttonType.outlinedBorder != null
                                ? context.theme.textTheme.bodyMedium?.color
                                : BasicAppColors.white),
                        height: 0,
                        fontSize: fontSize,
                      ),
                ),
          ),
        ),
      );
}
