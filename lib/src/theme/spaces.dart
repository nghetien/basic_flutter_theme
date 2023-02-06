import 'package:basic_flutter_theme/basic_flutter_theme.dart';
import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: size);

  static VSpace get p4 => VSpace(BasicPaddings().p4);

  static VSpace get p8 => VSpace(BasicPaddings().p8);

  static VSpace get p12 => VSpace(BasicPaddings().p12);

  static VSpace get p18 => VSpace(BasicPaddings().p18);

  static VSpace get p32 => VSpace(BasicPaddings().p32);
}

class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: size);

  static HSpace get p4 => HSpace(BasicPaddings().p4);

  static HSpace get p8 => HSpace(BasicPaddings().p8);

  static HSpace get p12 => HSpace(BasicPaddings().p12);

  static HSpace get p18 => HSpace(BasicPaddings().p18);

  static HSpace get p32 => HSpace(BasicPaddings().p32);
}
