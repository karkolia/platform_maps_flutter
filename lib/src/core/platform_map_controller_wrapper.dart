import 'dart:core';
import 'dart:typed_data';

import 'package:platform_maps_flutter/platform_maps_flutter.dart';

abstract class PlatformMapControllerWrapper {
  /// Programmatically show the Info Window for a [Marker].
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  /// * See also:
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future showMarkerInfoWindow(MarkerId markerId);

  /// Programmatically hide the Info Window for a [Marker].
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [isMarkerInfoWindowShown] to check if the Info Window is showing.
  Future hideMarkerInfoWindow(MarkerId markerId);

  /// Returns `true` when the [InfoWindow] is showing, `false` otherwise.
  /// The `markerId` must match one of the markers on the map.
  /// An invalid `markerId` triggers an "Invalid markerId" error.
  /// * See also:
  ///   * [showMarkerInfoWindow] to show the Info Window.
  ///   * [hideMarkerInfoWindow] to hide the Info Window.
  Future<bool> isMarkerInfoWindowShown(MarkerId markerId);

  /// Starts an animated change of the map camera position.
  /// The returned [Future] completes after the change has been started on the
  /// platform side.
  Future<void> animateCamera(CameraUpdate cameraUpdate);

  /// Changes the map camera position.
  /// The returned [Future] completes after the change has been made on the
  /// platform side.
  Future<void> moveCamera(CameraUpdate cameraUpdate);

  /// Return [LatLngBounds] defining the region that is visible in a map.
  Future<LatLngBounds> getVisibleRegion();

  /// Returns the image bytes of the map
  Future<Uint8List?> takeSnapshot();
}
