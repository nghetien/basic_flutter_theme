part of 'buttons.dart';

enum BasicButtonSize {
  large(42),
  medium(35),
  small(26);

  const BasicButtonSize(this.height);

  final double height;

  static double getPaddingHorizontal(BasicButtonSize? size) {
    if (size == null) return BasicPaddings.mainPadding;
    switch (size) {
      case BasicButtonSize.large:
        return BasicPaddings.mainPadding;
      case BasicButtonSize.medium:
        return BasicPaddings.p8;
      case BasicButtonSize.small:
        return BasicPaddings.p8;
      default:
        return BasicPaddings.mainPadding;
    }
  }

  static double getPaddingVertical(BasicButtonSize? size) {
    if (size == null) return BasicPaddings.p8;
    return 0;
  }

  static double getWidthLoading(BasicButtonSize? size) {
    if (size == null) return 20;
    switch (size) {
      case BasicButtonSize.large:
        return 14;
      case BasicButtonSize.medium:
        return 12;
      case BasicButtonSize.small:
        return 10;
      default:
        return 20;
    }
  }
}

class BasicButtonTypeStyle {
  final Color? backgroundColor;
  final Color? textColor;
  final OutlinedBorder? outlinedBorder;

  const BasicButtonTypeStyle({
    this.backgroundColor,
    this.textColor,
    this.outlinedBorder,
  });
}

enum BasicButtonType {
  primary,
  outline,
  danger,
  warning,
  success,
  info,
  none;

  Color? getTextColor(
    BuildContext context, {
    bool disabled = false,
    bool loading = false,
    Color? textColor,
  }) {
    return (disabled || loading)
        ? (textColor ?? style(context: context).textColor)?.withOpacity(0.4)
        : (textColor ?? style(context: context).textColor);
  }

  BasicButtonTypeStyle style({BuildContext? context}) {
    switch (this) {
      case BasicButtonType.primary:
        return BasicButtonTypeStyle(
          backgroundColor: BasicAppColors.primary,
          textColor: Colors.white,
          outlinedBorder: null,
        );
      case BasicButtonType.outline:
        return BasicButtonTypeStyle(
          backgroundColor: Colors.transparent,
          textColor: context?.theme.textTheme.bodyMedium?.color ?? BasicAppColors.grey,
          outlinedBorder: RoundedRectangleBorder(
            side: BorderSide(
              color: context?.theme.textTheme.bodyMedium?.color ?? BasicAppColors.grey,
              width: BasicBorders.mainBorders,
            ),
            borderRadius: BasicCorners.mainCornerBorder,
          ),
        );
      case BasicButtonType.danger:
        return const BasicButtonTypeStyle(
          backgroundColor: BasicAppColors.red,
          textColor: Colors.white,
          outlinedBorder: null,
        );
      case BasicButtonType.warning:
        return const BasicButtonTypeStyle(
          backgroundColor: BasicAppColors.yellow,
          textColor: Colors.white,
          outlinedBorder: null,
        );
      case BasicButtonType.success:
        return const BasicButtonTypeStyle(
          backgroundColor: BasicAppColors.green,
          textColor: Colors.white,
          outlinedBorder: null,
        );
      case BasicButtonType.info:
        return const BasicButtonTypeStyle(
          backgroundColor: BasicAppColors.blueLight,
          textColor: Colors.white,
          outlinedBorder: null,
        );
      case BasicButtonType.none:
        return BasicButtonTypeStyle(
          backgroundColor: Colors.transparent,
          textColor: context?.theme.textTheme.bodyMedium?.color,
          outlinedBorder: null,
        );
    }
  }
}

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    this.size,
    this.type = BasicButtonType.none,
    required this.onPressed,
    this.disabled = false,
    this.loading = false,
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

  final BasicButtonSize? size;
  final BasicButtonType type;
  final VoidCallback onPressed;
  final bool disabled;
  final bool loading;
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
        height: height ?? size?.height,
        width: width,
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          key: key,
          onPressed: () {
            if (disabled || loading) return;
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            alignment: alignment,
            backgroundColor: (disabled || loading)
                ? (background ?? type.style().backgroundColor)?.withOpacity(0.4)
                : (background ?? type.style().backgroundColor),
            shape: shape ??
                type.style(context: context).outlinedBorder?.copyWith(
                      side: BorderSide(
                        color: ((disabled || loading)
                                ? type
                                    .style(context: context)
                                    .outlinedBorder
                                    ?.side
                                    .color
                                    .withOpacity(0)
                                : type.style(context: context).outlinedBorder?.side.color) ??
                            Colors.transparent,
                      ),
                    ),
            padding: EdgeInsets.zero,
            shadowColor: shadowColor,
            elevation: elevation ?? 0,
            minimumSize: Size.zero,
            foregroundColor: hoverColor,
            splashFactory: splashFactory,
            enabledMouseCursor:
                (disabled || loading) ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
          ),
          child: Container(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: BasicButtonSize.getPaddingHorizontal(size),
                  vertical: BasicButtonSize.getPaddingVertical(size),
                ),
            child: _getContent(context),
          ),
        ),
      );

  Widget _getContent(BuildContext context) {
    Widget? content;
    if (child != null) {
      content = child!;
    } else if (text != null) {
      content = Text(
        text!,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        style: textStyle ??
            BasicTextStyles.body.copyWith(
              color: type.getTextColor(
                context,
                disabled: disabled,
                loading: loading,
                textColor: textColor,
              ),
              height: 0,
              fontSize: fontSize,
            ),
      );
    }

    if (loading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: BasicButtonSize.getWidthLoading(size),
            width: BasicButtonSize.getWidthLoading(size),
            child: CircularProgressIndicator(
              strokeWidth: BasicBorders.mainBorders,
              color: type.getTextColor(
                context,
                disabled: disabled,
                loading: loading,
                textColor: textColor,
              ),
            ),
          ),
          if (content != null)
            Padding(
              padding: EdgeInsets.only(
                left: BasicButtonSize.getPaddingHorizontal(size),
              ),
              child: content,
            )
        ],
      );
    }
    return content ?? const SizedBox.shrink();
  }
}
