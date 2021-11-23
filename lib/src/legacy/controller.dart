part of platform_maps_flutter;

class LegacyPlatformMapController {
  appleMaps.AppleMapController? appleController;
  googleMaps.GoogleMapController? googleController;
  huaweiMaps.HuaweiMapController? huaweiController;

  LegacyPlatformMapController(dynamic controller) {
    if (controller.runtimeType == googleMaps.GoogleMapController) {
      this.googleController = controller;
    } else if (controller.runtimeType == appleMaps.AppleMapController) {
      this.appleController = controller;
    } else if (controller.runtimeType == huaweiMaps.HuaweiMapController) {
      this.huaweiController = controller;
    }
  }

  /// Programmatically show the Info Window for a [Marker].
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future<void> showMarkerInfoWindow(MarkerId markerId) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleController!.showMarkerInfoWindow(markerId.appleMapsAnnotationId);
      case Map.googleMaps:
        return googleController!.showMarkerInfoWindow(markerId.googleMapsMarkerId);
      case Map.huaweiMaps:
        return huaweiController!.showMarkerInfoWindow(markerId.huaweiMapsMarkerId);
      default:
        throw ('Platform not supported.');
    }
  }

  /// Programmatically hide the Info Window for a [Marker].
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future<void> hideMarkerInfoWindow(MarkerId markerId) {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return appleController!.hideMarkerInfoWindow(markerId.appleMapsAnnotationId);
      case Map.googleMaps:
        return googleController!.hideMarkerInfoWindow(markerId.googleMapsMarkerId);
      case Map.huaweiMaps:
        return huaweiController!.hideMarkerInfoWindow(markerId.huaweiMapsMarkerId);
      default:
        throw ('Platform not supported.');
    }
  }

  /// Returns `true` when the [InfoWindow] is showing, `false` otherwise.
  ///
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  ///
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  Future<bool> isMarkerInfoWindowShown(MarkerId markerId) async {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return await appleController!.isMarkerInfoWindowShown(markerId.appleMapsAnnotationId) ?? false;
      case Map.googleMaps:
        return googleController!.isMarkerInfoWindowShown(markerId.googleMapsMarkerId);
      case Map.huaweiMaps:
        return huaweiController!.isMarkerInfoWindowShown(markerId.huaweiMapsMarkerId).then((result) => result ?? false);
      default:
        throw ('Platform not supported.');
    }
  }

  /// Starts an animated change of the map camera position.
  ///
  /// The returned [Future] completes after the change has been started on the
  /// platform side.
  Future<void> animateCamera(cameraUpdate) async {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return this.appleController!.animateCamera(cameraUpdate);
      case Map.googleMaps:
        return this.googleController!.animateCamera(cameraUpdate);
      case Map.huaweiMaps:
        return this.huaweiController!.animateCamera(cameraUpdate);
      default:
        throw ('Platform not supported.');
    }
  }

  /// Changes the map camera position.
  ///
  /// The returned [Future] completes after the change has been made on the
  /// platform side.
  Future<void> moveCamera(cameraUpdate) async {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return this.appleController!.moveCamera(cameraUpdate);
      case Map.googleMaps:
        return this.googleController!.moveCamera(cameraUpdate);
      case Map.huaweiMaps:
        return this.huaweiController!.moveCamera(cameraUpdate);
      default:
        throw ('Platform not supported.');
    }
  }

  /// Return [LatLngBounds] defining the region that is visible in a map.
  Future<LatLngBounds> getVisibleRegion() async {
    late LatLngBounds _bounds;
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        appleMaps.LatLngBounds appleBounds = await this.appleController!.getVisibleRegion();
        _bounds = LatLngBounds._fromAppleLatLngBounds(appleBounds);
        break;
      case Map.googleMaps:
        googleMaps.LatLngBounds googleBounds = await this.googleController!.getVisibleRegion();
        _bounds = LatLngBounds._fromGoogleLatLngBounds(googleBounds);
        break;
      case Map.huaweiMaps:
        huaweiMaps.LatLngBounds huaweiBounds = await this.huaweiController!.getVisibleRegion();
        _bounds = LatLngBounds._fromHuaweiLatLngBounds(huaweiBounds);
        break;
    }
    return _bounds;
  }

  /// Returns the image bytes of the map
  Future<Uint8List?> takeSnapshot() async {
    switch (PlatformMap.selectedMap) {
      case Map.appleMapKit:
        return this.appleController!.takeSnapshot();
      case Map.googleMaps:
        return this.googleController!.takeSnapshot();
      case Map.huaweiMaps:
        return this.huaweiController!.takeSnapshot();
      default:
        throw ('Platform not supported.');
    }
  }
}
