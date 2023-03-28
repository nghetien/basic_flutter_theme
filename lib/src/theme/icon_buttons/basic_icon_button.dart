part of 'icon_buttons.dart';

class BasicIconButton extends StatelessWidget {
  const BasicIconButton({
    Key? key,
    required this.onPressed,
    this.iconData,
    this.size,
    this.color,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final IconData? iconData;
  final double? size;
  final Color? color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: iconData != null
            ? Icon(
                iconData,
                size: size,
                color: color,
              )
            : icon,
      );
}
