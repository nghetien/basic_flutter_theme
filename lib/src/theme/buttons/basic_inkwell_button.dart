part of 'buttons.dart';

class BasicInkwellButton extends StatelessWidget {
  const BasicInkwellButton({
    Key? key,
    this.text,
    this.child,
    required this.onPressed,
    this.textColor,
    this.textFontSize,
    this.textFontWeight,
  }) : super(key: key);

  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        splashColor: Colors.transparent,
        child: child ?? Text(
          text ?? "",
          style: BasicTextStyles.body.copyWith(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            height: 0,
          ),
        )
    );
  }
}
