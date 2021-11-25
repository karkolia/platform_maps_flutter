part of './google_map_wrapper.dart';

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

  @override
  LatLng toLatLng(g.LatLng latLng) => LatLng(latLng.latitude, latLng.longitude);

  @override
  g.LatLng fromLatLng(LatLng latLng) => g.LatLng(latLng.latitude, latLng.longitude);

  @override
  g.MinMaxZoomPreference fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference) =>
      g.MinMaxZoomPreference(minMaxZoomPreference.minZoom, minMaxZoomPreference.maxZoom);

  @override
  Set<g.Marker> fromMarkerSet(Set<Marker> markers) => markers.map(fromMarker).toSet();

  @override
  g.Marker fromMarker(Marker marker) => g.Marker(
        markerId: fromMarkerId(marker.markerId),
        alpha: marker.alpha,
        anchor: Offset(0.5, 1.0),
        draggable: marker.draggable,
        infoWindow: fromInfoWindow(marker.infoWindow),
        onTap: marker.onTap,
        icon: marker.icon?.bitmapDescriptor ?? defaultMarkerBitmapDescriptor(),
        visible: marker.visible,
        onDragEnd: marker.onDragEnd != null ? (g.LatLng latLng) => marker.onDragEnd?.call(toLatLng(latLng)) : null,
        position: fromLatLng(marker.position),
      );

  @override
  g.MarkerId fromMarkerId(MarkerId markerId) => g.MarkerId(markerId.value);

  @override
  g.InfoWindow fromInfoWindow(InfoWindow infoWindow) => g.InfoWindow(
        anchor: infoWindow.anchor ?? Offset(0, 0),
        onTap: infoWindow.onTap,
        snippet: infoWindow.snippet,
        title: infoWindow.title,
      );

  @override
  Set<g.Polyline> fromPolylineSet(Set<Polyline> polylineSet) => polylineSet.map(fromPolyline).toSet();

  @override
  g.Polyline fromPolyline(Polyline polyline) => g.Polyline(
        polylineId: fromPolylineId(polyline.polylineId),
        color: polyline.color,
        consumeTapEvents: polyline.consumeTapEvents,
        endCap: fromCap(polyline.polylineCap),
        jointType: fromJointType(polyline.jointType),
        onTap: polyline.onTap,
        patterns: fromPatternItemList(polyline.patterns),
        points: fromLatLngList(polyline.points),
        startCap: fromCap(polyline.polylineCap),
        visible: polyline.visible,
        width: polyline.width,
      );

  @override
  g.PolylineId fromPolylineId(PolylineId polylineId) => g.PolylineId(polylineId.value);

  @override
  List<g.LatLng> fromLatLngList(List<LatLng> latlngList) => latlngList.map(fromLatLng).toList();

  @override
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

  @override
  Set<g.Polygon> fromPolygonSet(Set<Polygon> polygonSet) => polygonSet.map(fromPolygon).toSet();

  @override
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

  @override
  Set<g.Circle> fromCircleSet(Set<Circle> circleSet) => circleSet.map(fromCircle).toSet();

  @override
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

  @override
  LatLngBounds toLatLngBounds(g.LatLngBounds bounds) => LatLngBounds(
        southwest: toLatLng(bounds.southwest),
        northeast: toLatLng(bounds.northeast),
      );

  @override
  g.CameraUpdate zoomBy(double amount) => g.CameraUpdate.zoomBy(amount);

  @override
  g.CameraUpdate zoomIn() => g.CameraUpdate.zoomIn();

  @override
  g.CameraUpdate zoomOut() => g.CameraUpdate.zoomOut();

  @override
  g.CameraUpdate zoomTo(double zoom) => g.CameraUpdate.zoomTo(zoom);

  @override
  fromLatLngBounds(LatLngBounds latLngBounds) => g.LatLngBounds(
        southwest: fromLatLng(latLngBounds.southwest),
        northeast: fromLatLng(latLngBounds.northeast),
      );

  @override
  g.PatternItem fromPatternItem(PatternItem patternItem) {
    if (patternItem.json[0] == 'dash') {
      return g.PatternItem.dash(patternItem.json[1]);
    } else if (patternItem.json[0] == 'gap') {
      return g.PatternItem.gap(patternItem.json[1]);
    }
    return g.PatternItem.dot;
  }

  @override
  List<g.PatternItem> fromPatternItemList(List<PatternItem> patternItemList) =>
      patternItemList.map(fromPatternItem).toList();

  @override
  fromJointType(JointType jointType) => [g.JointType.mitered, g.JointType.bevel, g.JointType.round][jointType.value];

  @override
  g.BitmapDescriptor defaultMarkerBitmapDescriptor() => g.BitmapDescriptor.defaultMarker;

  @override
  Future<BitmapDescriptor> bitmapDescriptorFromAssetImage(ImageConfiguration configuration, String assetName,
      {AssetBundle? bundle, String? package}) async {
    g.BitmapDescriptor bitmap = await g.BitmapDescriptor.fromAssetImage(
      configuration,
      assetName,
      bundle: bundle,
      package: package,
    );
    return BitmapDescriptor(bitmap);
  }

  @override
  BitmapDescriptor bitmapDescriptorFromBytes(Uint8List byteData) =>
      BitmapDescriptor(g.BitmapDescriptor.fromBytes(byteData));

  @override
  g.CameraUpdate fromCameraUpdate(CameraUpdate cameraUpdate) {
    if (cameraUpdate is NewCameraPosition)
      return g.CameraUpdate.newCameraPosition(fromCameraPosition(cameraUpdate.cameraPosition));
    else if (cameraUpdate is NewLatLng)
      return g.CameraUpdate.newLatLng(fromLatLng(cameraUpdate.latLng));
    else if (cameraUpdate is NewLatLngZoom)
      return g.CameraUpdate.newLatLngZoom(fromLatLng(cameraUpdate.latLng), cameraUpdate.zoom);
    else if (cameraUpdate is NewLatLngBounds)
      return g.CameraUpdate.newLatLngBounds(fromLatLngBounds(cameraUpdate.bounds), cameraUpdate.padding);
    else if (cameraUpdate is ZoomBy)
      return g.CameraUpdate.zoomBy(cameraUpdate.amount);
    else if (cameraUpdate is ZoomIn)
      return g.CameraUpdate.zoomIn();
    else if (cameraUpdate is ZoomTo)
      return g.CameraUpdate.zoomTo(cameraUpdate.zoom);
    else
      return g.CameraUpdate.zoomOut();
  }
}
