library platform_maps_flutter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:platform_maps_flutter/src/apple_maps/apple_map_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_map_controller_wrapper.dart';
import 'package:platform_maps_flutter/src/core/platform_map_wrapper.dart';
import 'package:platform_maps_flutter/src/google_maps/google_map_wrapper.dart';
import 'package:platform_maps_flutter/src/huawei_maps/huawei_map_wrapper.dart';
import 'package:platform_maps_flutter/src/core/map_selection_helper.dart';

part 'src/core/model/bitmap.dart';
part 'src/core/model/camera_position.dart';
part 'src/core/model/camera_update.dart';
part 'src/core/model/cap.dart';
part 'src/core/model/circle.dart';
part 'src/core/model/info_window.dart';
part 'src/core/model/joint_type.dart';
part 'src/core/model/location.dart';
part 'src/core/model/marker.dart';
part 'src/core/model/pattern_item.dart';
part 'src/core/model/polygon.dart';
part 'src/core/model/polyline.dart';
part 'src/core/model/ui.dart';
part 'src/platform_map.dart';

enum Map { googleMaps, appleMapKit, huaweiMaps }
