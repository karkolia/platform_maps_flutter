import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

abstract class PlatformMapper<T, U, V> {
  dynamic fromMapType(MapType mapType);

  dynamic fromCameraPosition(CameraPosition cameraPosition);

  CameraPosition toCameraPosition(T cameraPosition);

  LatLng toLatLng(U latLng);

  dynamic fromLatLng(LatLng latLng);

  dynamic fromLatLngBounds(LatLngBounds latLngBounds);

  dynamic fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference);

  dynamic fromMarkerSet(Set<Marker> markers);

  dynamic fromMarker(Marker marker);

  dynamic fromMarkerId(MarkerId markerId);

  dynamic fromInfoWindow(InfoWindow infoWindow);

  dynamic fromPolylineSet(Set<Polyline> polylineSet);

  dynamic fromPolyline(Polyline polyline);

  dynamic fromPolylineId(PolylineId polylineId);

  dynamic fromLatLngList(List<LatLng> latLngList);

  dynamic fromCap(Cap cap);

  dynamic fromPolygonSet(Set<Polygon> polygonSet);

  dynamic fromPolygon(Polygon polygon);

  dynamic fromCircleSet(Set<Circle> circleSet);

  dynamic fromCircle(Circle circle);

  LatLngBounds toLatLngBounds(V bounds);

  dynamic zoomBy(double amount);

  dynamic zoomIn();

  dynamic zoomOut();

  dynamic zoomTo(double zoom);

  dynamic fromPatternItem(PatternItem patternItem);

  dynamic fromPatternItemList(List<PatternItem> patternItemList);

  dynamic fromJointType(JointType jointType);

  dynamic defaultMarkerBitmapDescriptor();

  Future<BitmapDescriptor> bitmapDescriptorFromAssetImage(ImageConfiguration configuration, String assetName,
      {AssetBundle? bundle, String? package});

  BitmapDescriptor bitmapDescriptorFromBytes(Uint8List byteData);

  dynamic fromCameraUpdate(CameraUpdate cameraUpdate);
}
