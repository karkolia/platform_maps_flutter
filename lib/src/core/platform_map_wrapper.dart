import 'package:flutter/cupertino.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/core/platform_mapper.dart';

abstract class PlatformMapWrapper<T extends PlatformMapper> {
  final PlatformMap platformMap;
  final T mapper;

  PlatformMapWrapper(this.platformMap, this.mapper);

  Widget getMap();
}
