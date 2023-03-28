part of 'images.dart';

class BasicAssetImage extends StatelessWidget {
  const BasicAssetImage({
    Key? key,
    this.size = BasicImageSize.medium,
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

  final BasicImageSize size;
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
      width: width ?? size.size,
      height: height ?? size.size,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth ?? BasicBorders.thin,
          color: borderColor ?? BasicAppColors.primary,
        ),
        shape: shape,
        borderRadius:
            borderRadius ?? ((shape != BoxShape.circle) ? BasicCorners.mainCornerBorder : null),
        image: DecorationImage(
          image: imageProvider ?? AssetImage(path ?? ''),
          fit: boxFit,
        ),
      ),
    );
  }
}
