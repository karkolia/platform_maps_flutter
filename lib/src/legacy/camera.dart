part of platform_maps_flutter;

/// The position of the map "camera", the view point from which the world is
/// shown in the map view. Aggregates the camera's [target] geographical
/// location, its [zoom] level, [pitch] angle, and [heading].
class CameraPosition {
  const CameraPosition({
    required this.target,
    this.bearing = 0.0,
    this.tilt = 0.0,
    this.zoom = 0,
  });

  /// The camera's bearing in degrees, measured clockwise from north.
  ///
  /// A bearing of 0.0, the default, means the camera points north.
  /// A bearing of 90.0 means the camera points east.
  final double bearing;

  /// The geographical location that the camera is pointing at.
  final LatLng target;

  // In degrees where 0 is looking straight down. Pitch may be clamped to an appropriate value.
  final double tilt;

  /// The zoom level of the camera.
  ///
  /// A zoom of 0.0, the default, means the screen width of the world is 256.
  /// Adding 1.0 to the zoom level doubles the screen width of the map. So at
  /// zoom level 3.0, the screen width of the world is 2³x256=2048.
  ///
  /// Larger zoom levels thus means the camera is placed closer to the surface
  /// of the Earth, revealing more detail in a narrower geographical region.
  ///
  /// The supported zoom level range depends on the map data and device. Values
  /// beyond the supported range are allowed, but on applying them to a map they
  /// will be silently clamped to the supported range.
  final double zoom;

  appleMaps.CameraPosition get appleMapsCameraPosition {
    return appleMaps.CameraPosition(
      target: this.target.appleLatLng,
      heading: this.bearing,
      pitch: this.tilt,
      zoom: this.zoom,
    );
  }

  huaweiMaps.CameraPosition get huaweiMapsCameraPosition {
    return huaweiMaps.CameraPosition(
      target: this.target.huaweiLatLng,
      bearing: this.bearing,
      tilt: this.tilt,
      zoom: this.zoom,
    );
  }

  static CameraPosition fromAppleMapCameraPosition(appleMaps.CameraPosition cameraPosition) {
    return CameraPosition(
      target: LatLng._fromAppleLatLng(cameraPosition.target),
      bearing: cameraPosition.heading,
      tilt: cameraPosition.pitch,
      zoom: cameraPosition.zoom,
    );
  }
}

class CameraUpdate {
  CameraUpdate._(this._json);

  /// Returns a camera update that moves the camera to the specified position.
  static newCameraPosition(CameraPosition cameraPosition) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.newCameraPosition(cameraPosition.appleMapsCameraPosition);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.newCameraPosition(cameraPosition.googleMapsCameraPosition);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.newCameraPosition(cameraPosition.huaweiMapsCameraPosition);
    }
  }

  /// Returns a camera update that moves the camera target to the specified geographical location.
  static newLatLng(LatLng latLng) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.newLatLng(latLng.appleLatLng);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.newLatLng(latLng.googleLatLng);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.newLatLng(latLng.huaweiLatLng);
    }
  }

  /// Returns a camera update that moves the camera target to the specified geographical location and zoom level.
  static newLatLngZoom(LatLng latLng, double zoom) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.newLatLngZoom(latLng.appleLatLng, zoom);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.newLatLngZoom(latLng.googleLatLng, zoom);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.newLatLngZoom(latLng.huaweiLatLng, zoom);
    }
  }

  /// Returns a camera update that transforms the camera so that
  /// the specified geographical bounding box is centered in the map
  /// view at the greatest possible zoom level.
  /// A non-zero [padding] insets the bounding box from the map view's edges.
  /// The camera's new tilt and bearing will both be 0.0.
  static newLatLngBounds(LatLngBounds bounds, double padding) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.newLatLngBounds(bounds.appleLatLngBounds, padding);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.newLatLngBounds(bounds.googleLatLngBounds, padding);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.newLatLngBounds(bounds.huaweiLatLngBounds, padding);
    }
  }

  /// Returns a camera update that modifies the camera zoom level by the specified amount.
  /// The optional [focus] is a screen point whose underlying geographical location
  /// should be invariant, if possible, by the movement.
  static zoomBy(double amount) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.zoomBy(amount);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.zoomBy(amount);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.zoomBy(amount);
    }
  }

  /// Returns a camera update that zooms the camera in,
  ///  bringing the camera closer to the surface of the Earth.
  ///
  /// Equivalent to the result of calling zoomBy(1.0).
  static zoomIn() {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.zoomIn();
      case Map.googleMaps:
        return googleMaps.CameraUpdate.zoomIn();
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.zoomIn();
    }
  }

  /// Returns a camera update that zooms the camera out,
  /// bringing the camera further away from the surface of the Earth.
  ///
  /// Equivalent to the result of calling zoomBy(-1.0).
  static zoomOut() {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.zoomOut();
      case Map.googleMaps:
        return googleMaps.CameraUpdate.zoomOut();
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.zoomOut();
    }
  }

  /// Returns a camera update that sets the camera zoom level.
  static zoomTo(double zoom) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleMaps.CameraUpdate.zoomTo(zoom);
      case Map.googleMaps:
        return googleMaps.CameraUpdate.zoomTo(zoom);
      case Map.huaweiMaps:
        return huaweiMaps.CameraUpdate.zoomTo(zoom);
    }
  }

  final dynamic _json;

  /// Converts this object to something serializable in JSON.
  dynamic toJson() => _json;
}
