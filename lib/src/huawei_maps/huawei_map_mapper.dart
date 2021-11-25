part of './huawei_map_wrapper.dart';

class HuaweiMapMapper extends PlatformMapper<h.CameraPosition, h.LatLng, h.LatLngBounds> {
  @override
  h.MapType fromMapType(MapType mapType) {
    switch (mapType) {
      case MapType.normal:
        return h.MapType.normal;
      case MapType.satellite:
        return h.MapType.terrain;
      case MapType.hybrid:
        return h.MapType.normal;
      default:
        return h.MapType.normal;
    }
  }

  @override
  h.CameraPosition fromCameraPosition(CameraPosition cameraPosition) => h.CameraPosition(
        target: fromLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  @override
  CameraPosition toCameraPosition(h.CameraPosition cameraPosition) => CameraPosition(
        target: toLatLng(cameraPosition.target),
        bearing: cameraPosition.bearing,
        tilt: cameraPosition.tilt,
        zoom: cameraPosition.zoom,
      );

  @override
  LatLng toLatLng(h.LatLng latLng) => LatLng(latLng.lat, latLng.lng);

  @override
  h.LatLng fromLatLng(LatLng latLng) => h.LatLng(latLng.latitude, latLng.longitude);

  @override
  h.MinMaxZoomPreference fromMinMaxZoomPreference(MinMaxZoomPreference minMaxZoomPreference) {
    const unbounded = h.MinMaxZoomPreference.unbounded;
    return h.MinMaxZoomPreference(
        minMaxZoomPreference.minZoom ?? unbounded.minZoom, minMaxZoomPreference.maxZoom ?? unbounded.maxZoom);
  }

  @override
  Set<h.Marker> fromMarkerSet(Set<Marker> markers) => markers.map(fromMarker).toSet();

  @override
  h.Marker fromMarker(Marker marker) => h.Marker(
        markerId: fromMarkerId(marker.markerId),
        alpha: marker.alpha,
        anchor: Offset(0.5, 1.0),
        draggable: marker.draggable,
        infoWindow: fromInfoWindow(marker.infoWindow),
        onClick: marker.onTap,
        icon: marker.icon?.bitmapDescriptor ?? defaultMarkerBitmapDescriptor(),
        visible: marker.visible,
        onDragEnd: marker.onDragEnd != null ? (h.LatLng latLng) => marker.onDragEnd?.call(toLatLng(latLng)) : null,
        position: fromLatLng(marker.position),
      );

  @override
  h.MarkerId fromMarkerId(MarkerId markerId) => h.MarkerId(markerId.value);

  @override
  h.InfoWindow fromInfoWindow(InfoWindow infoWindow) => h.InfoWindow(
        anchor: infoWindow.anchor ?? Offset(0, 0),
        onClick: infoWindow.onTap,
        snippet: infoWindow.snippet,
        title: infoWindow.title,
      );

  @override
  Set<h.Polyline> fromPolylineSet(Set<Polyline> polylineSet) => polylineSet.map(fromPolyline).toSet();

  @override
  h.Polyline fromPolyline(Polyline polyline) => h.Polyline(
        polylineId: fromPolylineId(polyline.polylineId),
        color: polyline.color,
        clickable: polyline.consumeTapEvents,
        endCap: fromCap(polyline.polylineCap),
        jointType: fromJointType(polyline.jointType),
        onClick: polyline.onTap,
        patterns: fromPatternItemList(polyline.patterns),
        points: fromLatLngList(polyline.points),
        startCap: fromCap(polyline.polylineCap),
        visible: polyline.visible,
        width: polyline.width,
      );

  @override
  h.PolylineId fromPolylineId(PolylineId polylineId) => h.PolylineId(polylineId.value);

  @override
  List<h.LatLng> fromLatLngList(List<LatLng> latlngList) => latlngList.map(fromLatLng).toList();

  @override
  h.Cap fromCap(Cap cap) {
    switch (cap) {
      case Cap.buttCap:
        return h.Cap.buttCap;
      case Cap.roundCap:
        return h.Cap.roundCap;
      case Cap.squareCap:
        return h.Cap.squareCap;
    }
  }

  @override
  Set<h.Polygon> fromPolygonSet(Set<Polygon> polygonSet) => polygonSet.map(fromPolygon).toSet();

  @override
  h.Polygon fromPolygon(Polygon polygon) => h.Polygon(
        polygonId: h.PolygonId(polygon.polygonId.value),
        clickable: polygon.consumeTapEvents,
        fillColor: polygon.fillColor,
        onClick: polygon.onTap,
        points: fromLatLngList(polygon.points),
        strokeColor: polygon.strokeColor,
        strokeWidth: polygon.strokeWidth,
        visible: polygon.visible,
      );

  @override
  Set<h.Circle> fromCircleSet(Set<Circle> circleSet) => circleSet.map(fromCircle).toSet();

  @override
  h.Circle fromCircle(Circle circle) => h.Circle(
        circleId: h.CircleId(circle.circleId.value),
        clickable: circle.consumeTapEvents,
        fillColor: circle.fillColor,
        onClick: circle.onTap,
        center: fromLatLng(circle.center),
        radius: circle.radius,
        strokeColor: circle.strokeColor,
        strokeWidth: circle.strokeWidth,
        visible: circle.visible,
      );

  @override
  LatLngBounds toLatLngBounds(h.LatLngBounds bounds) => LatLngBounds(
        southwest: toLatLng(bounds.southwest),
        northeast: toLatLng(bounds.northeast),
      );

  @override
  h.CameraUpdate zoomBy(double amount) => h.CameraUpdate.zoomBy(amount);

  @override
  h.CameraUpdate zoomIn() => h.CameraUpdate.zoomIn();

  @override
  h.CameraUpdate zoomOut() => h.CameraUpdate.zoomOut();

  @override
  h.CameraUpdate zoomTo(double zoom) => h.CameraUpdate.zoomTo(zoom);

  @override
  fromLatLngBounds(LatLngBounds latLngBounds) => h.LatLngBounds(
        southwest: fromLatLng(latLngBounds.southwest),
        northeast: fromLatLng(latLngBounds.northeast),
      );

  @override
  h.PatternItem fromPatternItem(PatternItem patternItem) {
    if (patternItem.json[0] == 'dash') {
      return h.PatternItem.dash(patternItem.json[1]);
    } else if (patternItem.json[0] == 'gap') {
      return h.PatternItem.gap(patternItem.json[1]);
    }
    return h.PatternItem.dot;
  }

  @override
  List<h.PatternItem> fromPatternItemList(List<PatternItem> patternItemList) =>
      patternItemList.map(fromPatternItem).toList();

  @override
  fromJointType(JointType jointType) => [h.JointType.mitered, h.JointType.bevel, h.JointType.round][jointType.value];

  @override
  h.BitmapDescriptor defaultMarkerBitmapDescriptor() => h.BitmapDescriptor.defaultMarker;

  @override
  Future<BitmapDescriptor> bitmapDescriptorFromAssetImage(ImageConfiguration configuration, String assetName,
      {AssetBundle? bundle, String? package}) async {
    h.BitmapDescriptor bitmap = await h.BitmapDescriptor.fromAssetImage(
      configuration,
      assetName,
      bundle: bundle,
      package: package,
    );
    return BitmapDescriptor(bitmap);
  }

  @override
  BitmapDescriptor bitmapDescriptorFromBytes(Uint8List byteData) =>
      BitmapDescriptor(h.BitmapDescriptor.fromBytes(byteData));

  @override
  h.CameraUpdate fromCameraUpdate(CameraUpdate cameraUpdate) {
    if (cameraUpdate is NewCameraPosition)
      return h.CameraUpdate.newCameraPosition(fromCameraPosition(cameraUpdate.cameraPosition));
    else if (cameraUpdate is NewLatLng)
      return h.CameraUpdate.newLatLng(fromLatLng(cameraUpdate.latLng));
    else if (cameraUpdate is NewLatLngZoom)
      return h.CameraUpdate.newLatLngZoom(fromLatLng(cameraUpdate.latLng), cameraUpdate.zoom);
    else if (cameraUpdate is NewLatLngBounds)
      return h.CameraUpdate.newLatLngBounds(fromLatLngBounds(cameraUpdate.bounds), cameraUpdate.padding);
    else if (cameraUpdate is ZoomBy)
      return h.CameraUpdate.zoomBy(cameraUpdate.amount);
    else if (cameraUpdate is ZoomIn)
      return h.CameraUpdate.zoomIn();
    else if (cameraUpdate is ZoomTo)
      return h.CameraUpdate.zoomTo(cameraUpdate.zoom);
    else
      return h.CameraUpdate.zoomOut();
  }
}
