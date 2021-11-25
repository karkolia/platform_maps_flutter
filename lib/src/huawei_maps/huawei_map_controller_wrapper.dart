part of './huawei_map_wrapper.dart';

class HuaweiMapControllerWrapper extends PlatformMapControllerWrapper {
  final h.HuaweiMapController controller;
  final HuaweiMapMapper mapper;

  HuaweiMapControllerWrapper(this.controller, this.mapper);

  @override
  Future showMarkerInfoWindow(MarkerId markerId) => controller.showMarkerInfoWindow(mapper.fromMarkerId(markerId));

  @override
  Future hideMarkerInfoWindow(MarkerId markerId) => controller.hideMarkerInfoWindow(mapper.fromMarkerId(markerId));

  @override
  Future<bool> isMarkerInfoWindowShown(MarkerId markerId) async {
    var result = await controller.isMarkerInfoWindowShown(mapper.fromMarkerId(markerId));
    return (result == null) ? false : result;
  }

  @override
  Future<void> animateCamera(cameraUpdate) => controller.animateCamera(mapper.fromCameraUpdate(cameraUpdate));

  @override
  Future<void> moveCamera(cameraUpdate) => controller.moveCamera(mapper.fromCameraUpdate(cameraUpdate));

  @override
  Future<LatLngBounds> getVisibleRegion() async {
    h.LatLngBounds googleBounds = await controller.getVisibleRegion();
    return mapper.toLatLngBounds(googleBounds);
  }

  @override
  Future<Uint8List?> takeSnapshot() => controller.takeSnapshot();
}
