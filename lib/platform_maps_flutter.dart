library platform_maps_flutter;

import 'dart:io';
import 'dart:typed_data';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as appleMaps;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:huawei_map/map.dart' as huaweiMaps;
import 'package:platform_maps_flutter/src/google_maps/google_map_wrapper.dart';
import 'package:platform_maps_flutter/src/legacy/map_selection_helper.dart';
import 'package:platform_maps_flutter/src/platform_map_wrapper.dart';

part 'src/legacy/bitmap.dart';

part 'src/legacy/camera.dart';

part 'src/legacy/cap.dart';

part 'src/legacy/circle.dart';

part 'src/legacy/controller.dart';

part 'src/legacy/joint_type.dart';

part 'src/legacy/location.dart';

part 'src/legacy/marker.dart';

part 'src/legacy/pattern_item.dart';

part 'src/legacy/polygon.dart';

part 'src/legacy/polyline.dart';

part 'src/legacy/ui.dart';

part 'src/platform_map.dart';

enum Map { googleMaps, appleMapKit, huaweiMaps }
