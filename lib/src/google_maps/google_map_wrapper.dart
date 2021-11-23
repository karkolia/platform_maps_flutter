import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/google_maps/google_map_mapper.dart';
import 'package:platform_maps_flutter/src/platform_map_wrapper.dart';

part './google_map_controller_wrapper.dart';

class GoogleMapWrapper extends PlatformMapWrapper {
  GoogleMapMapper mapper = GoogleMapMapper();

  GoogleMapWrapper(PlatformMap platformMap) : super(platformMap);

  @override
  Widget getMap() {
    return googleMaps.GoogleMap(
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
      onCameraMoveStarted: platformMap.onCameraMoveStarted,
      tiltGesturesEnabled: platformMap.tiltGesturesEnabled,
      rotateGesturesEnabled: platformMap.rotateGesturesEnabled,
      zoomControlsEnabled: platformMap.zoomControlsEnabled,
      zoomGesturesEnabled: platformMap.zoomGesturesEnabled,
      scrollGesturesEnabled: platformMap.scrollGesturesEnabled,
      onMapCreated: (controller) => platformMap.onMapCreated?.call(GoogleMapControllerWrapper(controller, mapper)),
      onCameraMove: (cameraPosition) => platformMap.onCameraMove?.call(mapper.toCameraPosition(cameraPosition)),
      onTap: (position) => platformMap.onTap?.call(mapper.toLatLng(position)),
      onLongPress: (position) => platformMap.onLongPress?.call(mapper.toLatLng(position)),
      trafficEnabled: platformMap.trafficEnabled,
      minMaxZoomPreference: mapper.fromMinMaxZoomPreference(platformMap.minMaxZoomPreference),
    );
  }
}
