part of './google_map_wrapper.dart';

class GoogleMapControllerWrapper extends PlatformMapControllerWrapper {
  final g.GoogleMapController controller;
  final GoogleMapMapper mapper;

  GoogleMapControllerWrapper(this.controller, this.mapper);

  @override
  Future showMarkerInfoWindow(MarkerId markerId) => controller.showMarkerInfoWindow(mapper.fromMarkerId(markerId));

  @override
  Future hideMarkerInfoWindow(MarkerId markerId) => controller.hideMarkerInfoWindow(mapper.fromMarkerId(markerId));

  @override
  Future<bool> isMarkerInfoWindowShown(MarkerId markerId) =>
      controller.isMarkerInfoWindowShown(mapper.fromMarkerId(markerId));

  @override
  Future<void> animateCamera(cameraUpdate) => controller.animateCamera(mapper.fromCameraUpdate(cameraUpdate));

  @override
  Future<void> moveCamera(cameraUpdate) => controller.moveCamera(mapper.fromCameraUpdate(cameraUpdate));

  @override
  Future<LatLngBounds> getVisibleRegion() async {
    g.LatLngBounds googleBounds = await controller.getVisibleRegion();
    return mapper.toLatLngBounds(googleBounds);
  }

  @override
  Future<Uint8List?> takeSnapshot() => controller.takeSnapshot();
}
