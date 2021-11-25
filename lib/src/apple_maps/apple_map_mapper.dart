part of './apple_map_wrapper.dart';

class AppleMapMapper extends PlatformMapper<a.CameraPosition, a.LatLng, a.LatLngBounds> {
  @override
  a.MapType fromMapType(MapType mapType) {
    switch (mapType) {
      case MapType.normal:
        return a.MapType.standard;
      case MapType.satellite:
        return a.MapType.satellite;
      case MapType.hybrid:
        return a.MapType.hybrid;
      default:
        return a.MapType.standard;
    }
  }

  @override
  a.CameraPosition fromCameraPosition(CameraPosition cameraPosition) => a.CameraPosition(
        target: fromLatLng(cameraPosition.target),
        heading: cameraPosition.bearing,
        pitch: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  @override
  CameraPosition toCameraPosition(a.CameraPosition cameraPosition) => CameraPosition(
        target: toLatLng(cameraPosition.target),
        bearing: cameraPosition.heading,
        tilt: cameraPosition.pitch,
        zoom: cameraPosition.zoom,
      );

  @override
  LatLng toLatLng(a.LatLng latLng) => LatLng(latLng.latitude, latLng.longitude);

  @override
  a.LatLng fromLatLng(LatLng latLng) => a.LatLng(latLng.latitude, latLng.longitude);

  @override
  a.MinMaxZoomPreference fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference) {
    const unbounded = a.MinMaxZoomPreference.unbounded;
    return a.MinMaxZoomPreference(
        minMaxZoomPreference.minZoom ?? unbounded.minZoom, minMaxZoomPreference.maxZoom ?? unbounded.maxZoom);
  }

  @override
  Set<a.Annotation> fromMarkerSet(Set<Marker> markers) => markers.map(fromMarker).toSet();

  @override
  a.Annotation fromMarker(Marker marker) => a.Annotation(
        annotationId: fromMarkerId(marker.markerId),
        alpha: marker.alpha,
        anchor: Offset(0.5, 1.0),
        draggable: marker.draggable,
        infoWindow: fromInfoWindow(marker.infoWindow),
        onTap: marker.onTap,
        icon: marker.icon?.bitmapDescriptor ?? defaultMarkerBitmapDescriptor(),
        visible: marker.visible,
        onDragEnd: marker.onDragEnd != null ? (a.LatLng latLng) => marker.onDragEnd?.call(toLatLng(latLng)) : null,
        position: fromLatLng(marker.position),
      );

  @override
  a.AnnotationId fromMarkerId(MarkerId markerId) => a.AnnotationId(markerId.value);

  @override
  a.InfoWindow fromInfoWindow(InfoWindow infoWindow) => a.InfoWindow(
        anchor: infoWindow.anchor ?? Offset(0, 0),
        onTap: infoWindow.onTap,
        snippet: infoWindow.snippet,
        title: infoWindow.title,
      );

  @override
  Set<a.Polyline> fromPolylineSet(Set<Polyline> polylineSet) => polylineSet.map(fromPolyline).toSet();

  @override
  a.Polyline fromPolyline(Polyline polyline) => a.Polyline(
        polylineId: fromPolylineId(polyline.polylineId),
        color: polyline.color,
        consumeTapEvents: polyline.consumeTapEvents,
        polylineCap: fromCap(polyline.polylineCap),
        jointType: fromJointType(polyline.jointType),
        onTap: polyline.onTap,
        patterns: fromPatternItemList(polyline.patterns),
        points: fromLatLngList(polyline.points),
        visible: polyline.visible,
        width: polyline.width,
      );

  @override
  a.PolylineId fromPolylineId(PolylineId polylineId) => a.PolylineId(polylineId.value);

  @override
  List<a.LatLng> fromLatLngList(List<LatLng> latlngList) => latlngList.map(fromLatLng).toList();

  @override
  a.Cap fromCap(Cap cap) {
    switch (cap) {
      case Cap.buttCap:
        return a.Cap.buttCap;
      case Cap.roundCap:
        return a.Cap.roundCap;
      case Cap.squareCap:
        return a.Cap.squareCap;
    }
  }

  @override
  Set<a.Polygon> fromPolygonSet(Set<Polygon> polygonSet) => polygonSet.map(fromPolygon).toSet();

  @override
  a.Polygon fromPolygon(Polygon polygon) => a.Polygon(
        polygonId: a.PolygonId(polygon.polygonId.value),
        consumeTapEvents: polygon.consumeTapEvents,
        fillColor: polygon.fillColor,
        onTap: polygon.onTap,
        points: fromLatLngList(polygon.points),
        strokeColor: polygon.strokeColor,
        strokeWidth: polygon.strokeWidth,
        visible: polygon.visible,
      );

  @override
  Set<a.Circle> fromCircleSet(Set<Circle> circleSet) => circleSet.map(fromCircle).toSet();

  @override
  a.Circle fromCircle(Circle circle) => a.Circle(
        circleId: a.CircleId(circle.circleId.value),
        consumeTapEvents: circle.consumeTapEvents,
        fillColor: circle.fillColor,
        onTap: circle.onTap,
        center: fromLatLng(circle.center),
        radius: circle.radius,
        strokeColor: circle.strokeColor,
        strokeWidth: circle.strokeWidth,
        visible: circle.visible,
      );

  @override
  LatLngBounds toLatLngBounds(a.LatLngBounds bounds) => LatLngBounds(
        southwest: toLatLng(bounds.southwest),
        northeast: toLatLng(bounds.northeast),
      );

  @override
  a.CameraUpdate zoomBy(double amount) => a.CameraUpdate.zoomBy(amount);

  @override
  a.CameraUpdate zoomIn() => a.CameraUpdate.zoomIn();

  @override
  a.CameraUpdate zoomOut() => a.CameraUpdate.zoomOut();

  @override
  a.CameraUpdate zoomTo(double zoom) => a.CameraUpdate.zoomTo(zoom);

  @override
  fromLatLngBounds(LatLngBounds latLngBounds) => a.LatLngBounds(
        southwest: fromLatLng(latLngBounds.southwest),
        northeast: fromLatLng(latLngBounds.northeast),
      );

  @override
  a.PatternItem fromPatternItem(PatternItem patternItem) {
    if (patternItem.json[0] == 'dash') {
      return a.PatternItem.dash(patternItem.json[1]);
    } else if (patternItem.json[0] == 'gap') {
      return a.PatternItem.gap(patternItem.json[1]);
    }
    return a.PatternItem.dot;
  }

  @override
  List<a.PatternItem> fromPatternItemList(List<PatternItem> patternItemList) =>
      patternItemList.map(fromPatternItem).toList();

  @override
  fromJointType(JointType jointType) => [a.JointType.mitered, a.JointType.bevel, a.JointType.round][jointType.value];

  @override
  a.BitmapDescriptor defaultMarkerBitmapDescriptor() => a.BitmapDescriptor.defaultAnnotation;

  @override
  Future<BitmapDescriptor> bitmapDescriptorFromAssetImage(ImageConfiguration configuration, String assetName,
      {AssetBundle? bundle, String? package}) async {
    a.BitmapDescriptor bitmap = await a.BitmapDescriptor.fromAssetImage(
      configuration,
      assetName,
      bundle: bundle,
      package: package,
    );
    return BitmapDescriptor(bitmap);
  }

  @override
  BitmapDescriptor bitmapDescriptorFromBytes(Uint8List byteData) =>
      BitmapDescriptor(a.BitmapDescriptor.fromBytes(byteData));

  @override
  a.CameraUpdate fromCameraUpdate(CameraUpdate cameraUpdate) {
    if (cameraUpdate is NewCameraPosition)
      return a.CameraUpdate.newCameraPosition(fromCameraPosition(cameraUpdate.cameraPosition));
    else if (cameraUpdate is NewLatLng)
      return a.CameraUpdate.newLatLng(fromLatLng(cameraUpdate.latLng));
    else if (cameraUpdate is NewLatLngZoom)
      return a.CameraUpdate.newLatLngZoom(fromLatLng(cameraUpdate.latLng), cameraUpdate.zoom);
    else if (cameraUpdate is NewLatLngBounds)
      return a.CameraUpdate.newLatLngBounds(fromLatLngBounds(cameraUpdate.bounds), cameraUpdate.padding);
    else if (cameraUpdate is ZoomBy)
      return a.CameraUpdate.zoomBy(cameraUpdate.amount);
    else if (cameraUpdate is ZoomIn)
      return a.CameraUpdate.zoomIn();
    else if (cameraUpdate is ZoomTo)
      return a.CameraUpdate.zoomTo(cameraUpdate.zoom);
    else
      return a.CameraUpdate.zoomOut();
  }
}
