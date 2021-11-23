import 'package:platform_maps_flutter/platform_maps_flutter.dart';

abstract class PlatformMapper<T, U, V> {
  dynamic fromMapType(MapType mapType);

  dynamic fromCameraPosition(CameraPosition cameraPosition);

  CameraPosition toCameraPosition(T cameraPosition);

  LatLng toLatLng(U latLng);

  dynamic fromLatLng(LatLng latLng);

  dynamic newCameraPosition(CameraPosition cameraPosition);

  dynamic fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference);

  dynamic fromMarkerSet(Set<Marker> markers);

  dynamic fromMarker(Marker marker);

  dynamic fromMarkerId(MarkerId markerId);

  dynamic fromInfoWindow(InfoWindow infoWindow);

  dynamic fromPolylineSet(Set<Polyline> polylineSet);

  dynamic fromPolyline(Polyline polyline);

  dynamic fromCap(Cap cap);

  dynamic fromPolygonSet(Set<Polygon> polygonSet);

  dynamic fromPolygon(Polygon polygon);

  dynamic fromCircleSet(Set<Circle> circleSet);

  dynamic fromCircle(Circle circle);

  LatLngBounds toLatLngBounds(V bounds);
}
