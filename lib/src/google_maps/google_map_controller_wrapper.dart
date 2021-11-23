part of 'google_map_wrapper.dart';

class GoogleMapControllerWrapper {

  PlatformMapController(dynamic controller) {
    this.libController = controller;
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
    return libController!.showMarkerInfoWindow(fromMarkerId(markerId));
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
    return libController!.hideMarkerInfoWindow(fromMarkerId(markerId));
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
    return libController!.isMarkerInfoWindowShown(fromMarkerId(markerId));
  }

  /// Starts an animated change of the map camera position.
  ///
  /// The returned [Future] completes after the change has been started on the
  /// platform side.
  Future<void> animateCamera(cameraUpdate) async {
    return libController!.animateCamera(cameraUpdate);
  }

  /// Changes the map camera position.
  ///
  /// The returned [Future] completes after the change has been made on the
  /// platform side.
  Future<void> moveCamera(cameraUpdate) async {
    return libController!.moveCamera(cameraUpdate);
  }

  /// Return [LatLngBounds] defining the region that is visible in a map.
  Future<LatLngBounds> getVisibleRegion() async {
    late LatLngBounds _bounds;
    googleMaps.LatLngBounds googleBounds = await libController!.getVisibleRegion();
    _bounds = toLatLngBounds(googleBounds);
    return _bounds;
  }

  /// Returns the image bytes of the map
  Future<Uint8List?> takeSnapshot() async {
    return libController!.takeSnapshot();
  }
}
