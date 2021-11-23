import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:platform_maps_flutter/src/platform_mapper.dart';

class GoogleMapMapper extends PlatformMapper{

  @override
  googleMaps.MapType fromMapType(MapType mapType) {
    switch (mapType) {
      case MapType.normal:
        return googleMaps.MapType.normal;
      case MapType.satellite:
        return googleMaps.MapType.satellite;
      case MapType.hybrid:
        return googleMaps.MapType.hybrid;
      default:
        return googleMaps.MapType.normal;
    }
  }

  googleMaps.CameraPosition fromCameraPosition(CameraPosition cameraPosition) => googleMaps.CameraPosition(
        target: fromLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  CameraPosition toCameraPosition(googleMaps.CameraPosition cameraPosition) => CameraPosition(
        target: toLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  LatLng toLatLng(googleMaps.LatLng latLng) => LatLng(latLng.latitude, latLng.longitude);

  googleMaps.LatLng fromLatLng(LatLng latLng) => googleMaps.LatLng(latLng.latitude, latLng.longitude);

  newCameraPosition(CameraPosition cameraPosition) =>
      googleMaps.CameraUpdate.newCameraPosition(fromCameraPosition(cameraPosition));

  googleMaps.MinMaxZoomPreference fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference) =>
      googleMaps.MinMaxZoomPreference(minMaxZoomPreference.minZoom, minMaxZoomPreference.maxZoom);

  Set<googleMaps.Marker> fromMarkerSet(Set<Marker> markers) => markers.map(fromMarker).toSet();

  googleMaps.Marker fromMarker(Marker marker) => googleMaps.Marker(
        markerId: fromMarkerId(marker.markerId),
        alpha: marker.alpha,
        anchor: Offset(0.5, 1.0),
        draggable: marker.draggable,
        infoWindow: fromInfoWindow(marker.infoWindow),
        onTap: marker.onTap,
        icon: marker.icon?.bitmapDescriptor ?? BitmapDescriptor.defaultMarker?.bitmapDescriptor,
        visible: marker.visible,
        onDragEnd:
            marker.onDragEnd != null ? (googleMaps.LatLng latLng) => marker.onDragEnd?.call(toLatLng(latLng)) : null,
        position: fromLatLng(marker.position),
      );

  googleMaps.MarkerId fromMarkerId(MarkerId markerId) => googleMaps.MarkerId(markerId.value);

  googleMaps.InfoWindow fromInfoWindow(InfoWindow infoWindow) => googleMaps.InfoWindow(
        anchor: infoWindow.anchor ?? Offset(0, 0),
        onTap: infoWindow.onTap,
        snippet: infoWindow.snippet,
        title: infoWindow.title,
      );

  Set<googleMaps.Polyline> fromPolylineSet(Set<Polyline> polylineSet) => polylineSet.map(fromPolyline).toSet();

  googleMaps.Polyline fromPolyline(Polyline polyline) => googleMaps.Polyline(
        polylineId: polyline.polylineId.googleMapsPolylineId(),
        color: polyline.color,
        consumeTapEvents: polyline.consumeTapEvents,
        endCap: fromCap(polyline.polylineCap),
        jointType: JointType.getGoogleMapsJointType(polyline.jointType),
        onTap: polyline.onTap,
        patterns: PatternItem.getGoogleMapsPatternItemList(polyline.patterns),
        points: LatLng.googleMapsLatLngsFromList(polyline.points),
        startCap: fromCap(polyline.polylineCap),
        visible: polyline.visible,
        width: polyline.width,
      );

  googleMaps.Cap fromCap(Cap cap) {
    switch (cap) {
      case Cap.buttCap:
        return googleMaps.Cap.buttCap;
      case Cap.roundCap:
        return googleMaps.Cap.roundCap;
      case Cap.squareCap:
        return googleMaps.Cap.squareCap;
    }
  }

  Set<googleMaps.Polygon> fromPolygonSet(Set<Polygon> polygonSet) => polygonSet.map(fromPolygon).toSet();

  googleMaps.Polygon fromPolygon(Polygon polygon) => googleMaps.Polygon(
        polygonId: googleMaps.PolygonId(polygon.polygonId.value),
        consumeTapEvents: polygon.consumeTapEvents,
        fillColor: polygon.fillColor,
        onTap: polygon.onTap,
        points: LatLng.googleMapsLatLngsFromList(polygon.points),
        strokeColor: polygon.strokeColor,
        strokeWidth: polygon.strokeWidth,
        visible: polygon.visible,
      );

  Set<googleMaps.Circle> fromCircleSet(Set<Circle> circleSet) => circleSet.map(fromCircle).toSet();

  googleMaps.Circle fromCircle(Circle circle) => googleMaps.Circle(
        circleId: googleMaps.CircleId(circle.circleId.value),
        consumeTapEvents: circle.consumeTapEvents,
        fillColor: circle.fillColor,
        onTap: circle.onTap,
        center: fromLatLng(circle.center),
        radius: circle.radius,
        strokeColor: circle.strokeColor,
        strokeWidth: circle.strokeWidth,
        visible: circle.visible,
      );

  LatLngBounds toLatLngBounds(googleMaps.LatLngBounds bounds) => LatLngBounds(
        southwest: toLatLng(bounds.southwest),
        northeast: toLatLng(bounds.northeast),
      );
}
