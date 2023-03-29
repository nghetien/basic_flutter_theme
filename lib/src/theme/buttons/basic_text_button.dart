part of 'buttons.dart';

class BasicTextButton extends StatelessWidget {
  const BasicTextButton({
    Key? key,
    this.text,
    this.child,
    required this.onPressed,
    this.textColor,
    this.textFontSize,
    this.textFontWeight,
    this.cursor = SystemMouseCursors.click,
  }) : super(key: key);

  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: MouseRegion(
        cursor: cursor,
        child: child ??
            Text(
              text ?? "",
              style: BasicTextStyles.body.copyWith(
                color: textColor,
                fontSize: textFontSize,
                fontWeight: textFontWeight,
                height: 0,
              ),
            ),
      ),
    );
  }
}
