part of platform_maps_flutter;

abstract class CameraUpdate {
  static CameraUpdate newCameraPosition(CameraPosition cameraPosition) => NewCameraPosition(cameraPosition);

  static CameraUpdate newLatLng(LatLng latLng) => NewLatLng(latLng);

  static CameraUpdate newLatLngZoom(LatLng latLng, double zoom) => NewLatLngZoom(latLng, zoom);

  static CameraUpdate newLatLngBounds(LatLng latLng, double zoom) => NewLatLngZoom(latLng, zoom);

  static CameraUpdate zoomBy(double amount) => ZoomBy(amount);

  static CameraUpdate zoomIn() => ZoomIn();

  static CameraUpdate zoomOut() => ZoomOut();

  static CameraUpdate zoomTo(double zoom) => ZoomTo(zoom);
}

class NewCameraPosition extends CameraUpdate {
  CameraPosition cameraPosition;

  NewCameraPosition(this.cameraPosition);
}

class NewLatLng extends CameraUpdate {
  LatLng latLng;

  NewLatLng(this.latLng);
}

class NewLatLngZoom extends CameraUpdate {
  LatLng latLng;
  double zoom;

  NewLatLngZoom(this.latLng, this.zoom);
}

class NewLatLngBounds extends CameraUpdate {
  LatLngBounds bounds;
  double padding;

  NewLatLngBounds(this.bounds, this.padding);
}

class ZoomBy extends CameraUpdate {
  double amount;

  ZoomBy(this.amount);
}

class ZoomIn extends CameraUpdate {}

class ZoomOut extends CameraUpdate {}

class ZoomTo extends CameraUpdate {
  double zoom;

  ZoomTo(this.zoom);
}
