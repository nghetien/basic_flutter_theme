library basic_images;

import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

part 'basic_asset_image.dart';

part 'basic_network_image.dart';

enum BasicImageSize {
  small(32),
  medium(40),
  large(60);

  final double size;

  const BasicImageSize(this.size);
}