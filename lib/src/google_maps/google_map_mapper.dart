import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as g;
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/platform_mapper.dart';

class GoogleMapMapper extends PlatformMapper<g.CameraPosition, g.LatLng, g.LatLngBounds> {
  @override
  g.MapType fromMapType(MapType mapType) {
    switch (mapType) {
      case MapType.normal:
        return g.MapType.normal;
      case MapType.satellite:
        return g.MapType.satellite;
      case MapType.hybrid:
        return g.MapType.hybrid;
      default:
        return g.MapType.normal;
    }
  }

  @override
  g.CameraPosition fromCameraPosition(CameraPosition cameraPosition) => g.CameraPosition(
        target: fromLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  @override
  CameraPosition toCameraPosition(g.CameraPosition cameraPosition) => CameraPosition(
        target: toLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  LatLng toLatLng(g.LatLng latLng) => LatLng(latLng.latitude, latLng.longitude);

  g.LatLng fromLatLng(LatLng latLng) => g.LatLng(latLng.latitude, latLng.longitude);

  newCameraPosition(CameraPosition cameraPosition) =>
      g.CameraUpdate.newCameraPosition(fromCameraPosition(cameraPosition));

  g.MinMaxZoomPreference fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference) =>
      g.MinMaxZoomPreference(minMaxZoomPreference.minZoom, minMaxZoomPreference.maxZoom);

  Set<g.Marker> fromMarkerSet(Set<Marker> markers) => markers.map(fromMarker).toSet();

  g.Marker fromMarker(Marker marker) => g.Marker(
        markerId: fromMarkerId(marker.markerId),
        alpha: marker.alpha,
        anchor: Offset(0.5, 1.0),
        draggable: marker.draggable,
        infoWindow: fromInfoWindow(marker.infoWindow),
        onTap: marker.onTap,
        icon: marker.icon?.bitmapDescriptor ?? BitmapDescriptor.defaultMarker?.bitmapDescriptor,
        visible: marker.visible,
        onDragEnd: marker.onDragEnd != null ? (g.LatLng latLng) => marker.onDragEnd?.call(toLatLng(latLng)) : null,
        position: fromLatLng(marker.position),
      );

  g.MarkerId fromMarkerId(MarkerId markerId) => g.MarkerId(markerId.value);

  g.InfoWindow fromInfoWindow(InfoWindow infoWindow) => g.InfoWindow(
        anchor: infoWindow.anchor ?? Offset(0, 0),
        onTap: infoWindow.onTap,
        snippet: infoWindow.snippet,
        title: infoWindow.title,
      );

  Set<g.Polyline> fromPolylineSet(Set<Polyline> polylineSet) => polylineSet.map(fromPolyline).toSet();

  g.Polyline fromPolyline(Polyline polyline) => g.Polyline(
        polylineId: fromPolylineId(polyline.polylineId),
        color: polyline.color,
        consumeTapEvents: polyline.consumeTapEvents,
        endCap: fromCap(polyline.polylineCap),
        jointType: JointType.getGoogleMapsJointType(polyline.jointType),
        onTap: polyline.onTap,
        patterns: PatternItem.getGoogleMapsPatternItemList(polyline.patterns),
        points: fromLatLngList(polyline.points),
        startCap: fromCap(polyline.polylineCap),
        visible: polyline.visible,
        width: polyline.width,
      );

  g.PolylineId fromPolylineId(PolylineId polylineId) => g.PolylineId(polylineId.value);

  List<g.LatLng> fromLatLngList(List<LatLng> latlngList) => latlngList.map(fromLatLng).toList();

  g.Cap fromCap(Cap cap) {
    switch (cap) {
      case Cap.buttCap:
        return g.Cap.buttCap;
      case Cap.roundCap:
        return g.Cap.roundCap;
      case Cap.squareCap:
        return g.Cap.squareCap;
    }
  }

  Set<g.Polygon> fromPolygonSet(Set<Polygon> polygonSet) => polygonSet.map(fromPolygon).toSet();

  g.Polygon fromPolygon(Polygon polygon) => g.Polygon(
        polygonId: g.PolygonId(polygon.polygonId.value),
        consumeTapEvents: polygon.consumeTapEvents,
        fillColor: polygon.fillColor,
        onTap: polygon.onTap,
        points: fromLatLngList(polygon.points),
        strokeColor: polygon.strokeColor,
        strokeWidth: polygon.strokeWidth,
        visible: polygon.visible,
      );

  Set<g.Circle> fromCircleSet(Set<Circle> circleSet) => circleSet.map(fromCircle).toSet();

  g.Circle fromCircle(Circle circle) => g.Circle(
        circleId: g.CircleId(circle.circleId.value),
        consumeTapEvents: circle.consumeTapEvents,
        fillColor: circle.fillColor,
        onTap: circle.onTap,
        center: fromLatLng(circle.center),
        radius: circle.radius,
        strokeColor: circle.strokeColor,
        strokeWidth: circle.strokeWidth,
        visible: circle.visible,
      );

  LatLngBounds toLatLngBounds(g.LatLngBounds bounds) => LatLngBounds(
        southwest: toLatLng(bounds.southwest),
        northeast: toLatLng(bounds.northeast),
      );
}
