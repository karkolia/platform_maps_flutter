// Copyright 2019 The Chromium Authors. All rights reserved.
part of platform_maps_flutter;

enum Cap {
  /// Cap that is squared off exactly at the start or end vertex of a [Polyline] with solid stroke pattern,
  ///  equivalent to having no additional cap beyond the start or end vertex.
  ///
  /// This is the default cap type at start and end vertices of Polylines with solid stroke pattern.
  buttCap,

  /// Cap that is a semicircle with radius equal to half the stroke width, centered at
  /// the start or end vertex of a [Polyline] with solid stroke pattern.
  roundCap,

  /// Cap that is squared off after extending half the stroke width beyond the start
  /// or end vertex of a [Polyline] with solid stroke pattern.
  squareCap,
}

/// Cap that can be applied at the start or end vertex of a [Polyline].
@immutable
class _Cap {
  static const googleMapsCaps = {
    Cap.buttCap: googleMaps.Cap.buttCap,
    Cap.roundCap: googleMaps.Cap.roundCap,
    Cap.squareCap: googleMaps.Cap.squareCap,
  };

  static const huaweiMapsCaps = {
    Cap.buttCap: huaweiMaps.Cap.buttCap,
    Cap.roundCap: huaweiMaps.Cap.roundCap,
    Cap.squareCap: huaweiMaps.Cap.squareCap,
  };

  static const appleMapsCaps = {
    Cap.buttCap: appleMaps.Cap.buttCap,
    Cap.roundCap: appleMaps.Cap.roundCap,
    Cap.squareCap: appleMaps.Cap.squareCap,
  };

  static googleMaps.Cap googlePolylineCap(Cap cap) {
    return googleMapsCaps[cap]!;
  }

  static huaweiMaps.Cap huaweiPolylineCap(Cap cap) {
    return huaweiMapsCaps[cap]!;
  }

  static appleMaps.Cap applePolylineCap(Cap cap) {
    return appleMapsCaps[cap]!;
  }
}
