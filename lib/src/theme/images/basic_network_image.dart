import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'basic_asset_image.dart';

class BasicNetworkImage extends StatelessWidget {
  const BasicNetworkImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  final String path;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;

  Widget _error() => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: BasicAppColors.greyOpacity04,
          border: Border.all(
            width: borderWidth ?? BasicBorders.thin,
            color: borderColor ?? BasicAppColors().primary,
          ),
          shape: shape,
          borderRadius: borderRadius,
        ),
      );

  Widget _loading(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: context.theme.colorScheme.background,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: BasicAppColors.greyOpacity01,
            border: Border.all(
              width: borderWidth ?? BasicBorders.thin,
              color: borderColor ?? BasicAppColors().primary,
            ),
            shape: shape,
            borderRadius: borderRadius,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: path,
        imageBuilder: (_, imageProvider) => BasicAssetImage(
          width: width,
          height: height,
          borderWidth: borderWidth,
          borderColor: borderColor,
          shape: shape,
          borderRadius: borderRadius,
          boxFit: boxFit,
          imageProvider: imageProvider,
        ),
        errorWidget: (_, __, ___) => _error(),
        progressIndicatorBuilder: (_, __, ___) => _loading(context),
      );
}
