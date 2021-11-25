import 'dart:core';
import 'dart:typed_data';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as a;
import 'package:flutter/cupertino.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/core/platform_map_controller_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_map_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_mapper.dart';

part './apple_map_controller_wrapper.dart';
part './apple_map_mapper.dart';

class AppleMapWrapper extends PlatformMapWrapper<AppleMapMapper> {
  AppleMapWrapper(PlatformMap platformMap) : super(platformMap, AppleMapMapper());

  @override
  Widget getMap() {
    return a.AppleMap(
      initialCameraPosition: mapper.fromCameraPosition(platformMap.initialCameraPosition),
      compassEnabled: platformMap.compassEnabled,
      mapType: mapper.fromMapType(platformMap.mapType),
      padding: platformMap.padding,
      annotations: mapper.fromMarkerSet(platformMap.markers),
      polylines: mapper.fromPolylineSet(platformMap.polylines),
      polygons: mapper.fromPolygonSet(platformMap.polygons),
      circles: mapper.fromCircleSet(platformMap.circles),
      gestureRecognizers: platformMap.gestureRecognizers,
      onCameraIdle: platformMap.onCameraIdle,
      myLocationButtonEnabled: platformMap.myLocationButtonEnabled,
      myLocationEnabled: platformMap.myLocationEnabled,
      onCameraMoveStarted: platformMap.onCameraMoveStarted,
      pitchGesturesEnabled: platformMap.tiltGesturesEnabled,
      rotateGesturesEnabled: platformMap.rotateGesturesEnabled,
      zoomGesturesEnabled: platformMap.zoomGesturesEnabled,
      scrollGesturesEnabled: platformMap.scrollGesturesEnabled,
      onMapCreated: (controller) => platformMap.onMapCreated?.call(AppleMapControllerWrapper(controller, mapper)),
      onCameraMove: (cameraPosition) => platformMap.onCameraMove?.call(mapper.toCameraPosition(cameraPosition)),
      onTap: (position) => platformMap.onTap?.call(mapper.toLatLng(position)),
      onLongPress: (position) => platformMap.onLongPress?.call(mapper.toLatLng(position)),
      trafficEnabled: platformMap.trafficEnabled,
      minMaxZoomPreference: mapper.fromMinMaxZoomPreference(platformMap.minMaxZoomPreference),
    );
  }
}
