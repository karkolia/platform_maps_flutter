import 'package:platform_maps_flutter/platform_maps_flutter.dart';

abstract class PlatformMapper {
  T fromMapType<T>(MapType mapType);

  T fromCameraPosition<T>(CameraPosition cameraPosition);

  CameraPosition toCameraPosition<T>(T cameraPosition);

  LatLng toLatLng<T>(T latLng);

  T fromLatLng<T>(LatLng latLng);

  T newCameraPosition<T>(CameraPosition cameraPosition);

  T fromMinMaxZoomPreference<T>(MinMaxZoomPreference minMaxZoomPreference);

  T fromMarkerSet<T>(Set<Marker> markers);

  T fromMarker<T>(Marker marker);

  T fromMarkerId<T>(MarkerId markerId);

  T fromInfoWindow<T>(InfoWindow infoWindow);

  T fromPolylineSet<T>(Set<Polyline> polylineSet);

  T fromPolyline<T>(Polyline polyline);

  T fromCap<T>(Cap cap);

  T fromPolygonSet<T>(Set<Polygon> polygonSet);

  T fromPolygon<T>(Polygon polygon);

  T fromCircleSet<T>(Set<Circle> circleSet);

  T fromCircle<T>(Circle circle);

  LatLngBounds toLatLngBounds<T>(T bounds);
}
