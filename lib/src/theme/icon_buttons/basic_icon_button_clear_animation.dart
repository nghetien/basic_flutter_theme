part of 'icon_buttons.dart';

class BasicIconButtonClearAnimation extends StatelessWidget {
  const BasicIconButtonClearAnimation({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) =>
      InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: icon,
      );
}
