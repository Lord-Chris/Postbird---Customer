// packages
export 'dart:io';
export 'dart:async';

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get/get_state_manager/get_state_manager.dart';
export 'package:get/instance_manager.dart';
export 'package:get/route_manager.dart';
export 'package:get_storage/get_storage.dart';
export 'package:rounded_loading_button/rounded_loading_button.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:image_picker/image_picker.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:flutter_polyline_points/flutter_polyline_points.dart';
export 'package:place_picker/uuid.dart';
export 'package:postbird/Screens/provider/google_map_service.dart';
export 'package:flutter_slidable/flutter_slidable.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
export 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
export 'package:local_auth/local_auth.dart';

// core
export 'package:postbird/core/api_strings.dart';
export 'package:postbird/core/app.dart';
export 'package:postbird/core/mixins/validator.dart';

// constants
export 'package:postbird/ui/constants/storage_keys.dart';
export 'package:postbird/ui/constants/constants.dart';

//models
export 'package:postbird/models/user.dart';
export 'package:postbird/models/failure.dart';
export 'package:postbird/models/api_response.dart';
export 'package:postbird/models/package.dart';
export 'package:postbird/models/place_model.dart';
export 'package:postbird/models/chat_item.dart';
export 'package:postbird/models/inbox_item.dart';
export 'package:postbird/models/notification_item.dart';

//repository
export 'package:postbird/repository/auth/auth_repository.dart';
export 'package:postbird/repository/auth/i_auth_repository.dart';
export 'package:postbird/repository/activity/activity_repository.dart';
export 'package:postbird/repository/activity/i_activity_repository.dart';
export 'package:postbird/repository/inbox/i_inbox_repository.dart';
export 'package:postbird/repository/inbox/inbox_repository.dart';
export 'package:postbird/repository/notifications/noification_repository.dart';

// services
export 'package:postbird/services/network_service/i_network_service.dart';
export 'package:postbird/services/network_service/network_service.dart';
export 'package:postbird/services/storage_service/i_storage_service.dart';
export 'package:postbird/services/storage_service/storage_service.dart';
export 'package:postbird/services/media_service/i_media_service.dart';
export 'package:postbird/services/media_service/media_service.dart';
export 'package:postbird/services/map_service/i_map_service.dart';
export 'package:postbird/services/map_service/map_service.dart';
export 'package:postbird/services/call_service/i_call_service.dart';
export 'package:postbird/services/call_service/call_service.dart';
export 'package:postbird/services/biometrics_service/i_biometrics_service.dart';
export 'package:postbird/services/biometrics_service/biometrics_service.dart';

// shared
export 'package:postbird/ui/shared/app_colors.dart';
export 'package:postbird/ui/shared/base_controller.dart';
export 'package:postbird/ui/shared/snackbar.dart';
export 'package:postbird/ui/shared/text_field.dart';
export 'package:postbird/ui/shared/button.dart';

// utilities
export 'package:postbird/utilities/map_utils.dart';
export 'package:postbird/utilities/general_utils.dart';
export 'package:postbird/utilities/repo_utils.dart';
export 'package:postbird/utilities/enums/driver_status.dart';
export 'package:postbird/utilities/enums/notification_category.dart';

// widgets
export 'package:postbird/ui/views/home/widgets/create_package_indicator.dart';
