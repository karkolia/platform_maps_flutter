import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/platform_map_wrapper.dart';

part './google_map_controller_wrapper.dart';

class GoogleMapWrapper extends PlatformMapWrapper {
  GoogleMapWrapper(PlatformMap platformMap) : super(platformMap);

  @override
  Widget getMap() {
    return googleMaps.GoogleMap(
      initialCameraPosition: fromCameraPosition(platformMap.initialCameraPosition),
      compassEnabled: platformMap.compassEnabled,
      mapType: fromMapType(platformMap.mapType),
      padding: platformMap.padding,
      markers: fromMarkerSet(platformMap.markers),
      polylines: fromPolylineSet(platformMap.polylines),
      polygons: fromPolygonSet(platformMap.polygons),
      circles: fromCircleSet(platformMap.circles),
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
      onMapCreated: (controller) => platformMap.onMapCreated?.call(PlatformMapController(controller)),
      onCameraMove: (cameraPosition) => platformMap.onCameraMove?.call(toCameraPosition(cameraPosition)),
      onTap: (position) => platformMap.onTap?.call(toLatLng(position)),
      onLongPress: (position) => platformMap.onLongPress?.call(toLatLng(position)),
      trafficEnabled: platformMap.trafficEnabled,
      minMaxZoomPreference: fromMinMaxZoomPreference(platformMap.minMaxZoomPreference),
    );
  }
}
