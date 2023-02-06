import 'package:flutter/material.dart';

class BasicIconButtonClearAnimation extends StatelessWidget {
  const BasicIconButtonClearAnimation({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
