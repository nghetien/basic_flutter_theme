library basic_images;

import 'package:basic_flutter_theme/src/styles/styles.dart';
import 'package:basic_flutter_theme/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

part 'basic_asset_image.dart';

part 'basic_network_image.dart';

class BasicImageType {
  const BasicImageType._(double size) : _size = size;

  final double _size;

  double get size => _size;

  static const BasicImageType small = BasicImageType._(32);
  static const BasicImageType medium = BasicImageType._(40);
  static const BasicImageType large = BasicImageType._(60);
}
