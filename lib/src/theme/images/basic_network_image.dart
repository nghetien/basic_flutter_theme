part of 'images.dart';

class BasicNetworkImage extends StatelessWidget {
  const BasicNetworkImage({
    Key? key,
    this.size = BasicImageSize.medium,
    required this.path,
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.boxFit = BoxFit.cover,
    this.assetPathWhenError,
    this.imageProviderWhenError,
  }) : super(key: key);

  final BasicImageSize size;
  final String path;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final BoxFit boxFit;
  final String? assetPathWhenError;
  final ImageProvider? imageProviderWhenError;

  Widget _error() => assetPathWhenError != null
      ? BasicAssetImage(
          path: assetPathWhenError!,
          width: width ?? size.size,
          height: height ?? size.size,
          borderWidth: borderWidth,
          borderColor: borderColor,
          shape: shape,
          borderRadius: borderRadius,
          boxFit: boxFit,
          imageProvider: imageProviderWhenError,
        )
      : Container(
          width: width ?? size.size,
          height: height ?? size.size,
          decoration: BoxDecoration(
            color: BasicAppColors.greyOpacity04,
            border: Border.all(
              width: borderWidth ?? BasicBorders.thin,
              color: borderColor ?? BasicAppColors.primary,
            ),
            shape: shape,
            borderRadius:
                borderRadius ?? ((shape != BoxShape.circle) ? BasicCorners.mainCornerBorder : null),
        ),
      );

  Widget _loading(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: context.theme.colorScheme.background,
        child: Container(
          width: width ?? size.size,
          height: height ?? size.size,
          decoration: BoxDecoration(
            color: BasicAppColors.greyOpacity01,
            border: Border.all(
              width: borderWidth ?? BasicBorders.thin,
              color: borderColor ?? BasicAppColors.primary,
            ),
            shape: shape,
            borderRadius:
                borderRadius ?? ((shape != BoxShape.circle) ? BasicCorners.mainCornerBorder : null),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: path,
        imageBuilder: (_, imageProvider) => BasicAssetImage(
          width: width ?? size.size,
          height: height ?? size.size,
          borderWidth: borderWidth,
          borderColor: borderColor,
          shape: shape,
          borderRadius:
              borderRadius ?? ((shape != BoxShape.circle) ? BasicCorners.mainCornerBorder : null),
          boxFit: boxFit,
          imageProvider: imageProvider,
        ),
        errorWidget: (_, __, ___) => _error(),
        progressIndicatorBuilder: (_, __, ___) => _loading(context),
      );
}
