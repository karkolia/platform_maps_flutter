import 'package:flutter/cupertino.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

abstract class PlatformMapWrapper {
  final PlatformMap platformMap;

  PlatformMapWrapper(this.platformMap);

  Widget getMap();
}
