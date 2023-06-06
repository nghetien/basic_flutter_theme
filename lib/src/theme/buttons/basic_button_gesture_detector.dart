part of 'buttons.dart';

enum BasicButtonGestureDetectorType {
  icon,
  text,
  customize,
}

class BasicButtonGestureDetector extends StatelessWidget {
  const BasicButtonGestureDetector({
    Key? key,
    required this.type,
    this.text,
    this.child,
    required this.onPressed,
    this.textColor,
    this.textFontSize,
    this.textFontWeight,
    this.iconData,
    this.size,
    this.color,
    this.icon,
    this.cursor = SystemMouseCursors.click,
  }) : super(key: key);

  final BasicButtonGestureDetectorType type;
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final IconData? iconData;
  final double? size;
  final Color? color;
  final Widget? icon;
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: cursor,
        child: _getChild(),
      ),
    );
  }

  Widget _getChild() {
    const Widget defaultWidget = SizedBox.shrink();
    switch (type) {
      case BasicButtonGestureDetectorType.icon:
        return iconData != null
            ? Icon(
                iconData,
                size: size,
                color: color,
              )
            : icon ?? defaultWidget;
      case BasicButtonGestureDetectorType.text:
        return Text(
          text ?? "",
          style: BasicTextStyles.body.copyWith(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            height: 0,
          ),
        );
      case BasicButtonGestureDetectorType.customize:
        return child ?? defaultWidget;
      default:
        return defaultWidget;
    }
  }
}
