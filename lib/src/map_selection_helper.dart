import 'dart:io';

import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class MapSelectionHelper {
  Map defaultSelectMap(Set<Map> availableMaps) {
    return Map.googleMaps;
  }

  Set<Map> getAvailableMaps() {
    return <Map>{Map.appleMapKit, Map.googleMaps};
  }

  bool hasAppleMapKit() => Platform.isIOS;

  bool hasGoogleMaps() => Platform.isAndroid;

  bool hasHuaweiMaps() => Platform.isAndroid;
}
