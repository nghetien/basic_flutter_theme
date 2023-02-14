import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:flutter/material.dart';

class BasicAssetImage extends StatelessWidget {
  const BasicAssetImage({
    Key? key,
    this.path,
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.boxFit = BoxFit.cover,
    this.imageProvider,
  })  : assert(
          (path == null && imageProvider != null) || (path != null && imageProvider == null),
          'You must provide either a path or an imageProvider',
        ),
        super(key: key);

  final String? path;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth ?? BasicBorders.thin,
          color: borderColor ?? BasicAppColors().primary,
        ),
        shape: shape,
        borderRadius: borderRadius,
        image: DecorationImage(
          image: imageProvider ?? AssetImage(path ?? ''),
          fit: boxFit,
        ),
      ),
    );
  }
}
