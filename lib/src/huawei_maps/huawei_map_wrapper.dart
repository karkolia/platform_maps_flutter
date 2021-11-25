import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:huawei_map/map.dart' as h;
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/core/platform_map_controller_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_map_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_mapper.dart';

part './huawei_map_controller_wrapper.dart';
part './huawei_map_mapper.dart';

class HuaweiMapWrapper extends PlatformMapWrapper<HuaweiMapMapper> {
  HuaweiMapWrapper(PlatformMap platformMap) : super(platformMap, HuaweiMapMapper());

  @override
  Widget getMap() {
    return h.HuaweiMap(
      initialCameraPosition: mapper.fromCameraPosition(platformMap.initialCameraPosition),
      compassEnabled: platformMap.compassEnabled,
      mapType: mapper.fromMapType(platformMap.mapType),
      padding: platformMap.padding,
      markers: mapper.fromMarkerSet(platformMap.markers),
      polylines: mapper.fromPolylineSet(platformMap.polylines),
      polygons: mapper.fromPolygonSet(platformMap.polygons),
      circles: mapper.fromCircleSet(platformMap.circles),
      gestureRecognizers: platformMap.gestureRecognizers,
      onCameraIdle: platformMap.onCameraIdle,
      myLocationButtonEnabled: platformMap.myLocationButtonEnabled,
      myLocationEnabled: platformMap.myLocationEnabled,
      onCameraMoveStarted: (i) => platformMap.onCameraMoveStarted?.call(),
      tiltGesturesEnabled: platformMap.tiltGesturesEnabled,
      rotateGesturesEnabled: platformMap.rotateGesturesEnabled,
      zoomControlsEnabled: platformMap.zoomControlsEnabled,
      zoomGesturesEnabled: platformMap.zoomGesturesEnabled,
      scrollGesturesEnabled: platformMap.scrollGesturesEnabled,
      onMapCreated: (controller) => platformMap.onMapCreated?.call(HuaweiMapControllerWrapper(controller, mapper)),
      onCameraMove: (cameraPosition) => platformMap.onCameraMove?.call(mapper.toCameraPosition(cameraPosition)),
      onClick: (position) => platformMap.onTap?.call(mapper.toLatLng(position)),
      onLongPress: (position) => platformMap.onLongPress?.call(mapper.toLatLng(position)),
      trafficEnabled: platformMap.trafficEnabled,
      minMaxZoomPreference: mapper.fromMinMaxZoomPreference(platformMap.minMaxZoomPreference),
    );
  }
}
