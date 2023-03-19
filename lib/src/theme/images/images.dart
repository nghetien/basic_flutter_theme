library basic_images;

import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

part 'basic_asset_image.dart';

part 'basic_network_image.dart';

class BasicImageSize {
  const BasicImageSize._(double size) : _size = size;

  final double _size;

  double get size => _size;

  static const BasicImageSize small = BasicImageSize._(32);
  static const BasicImageSize medium = BasicImageSize._(40);
  static const BasicImageSize large = BasicImageSize._(60);
}
