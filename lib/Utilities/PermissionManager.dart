import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static final permissionHandler = PermissionHandler();

  static Future<PermissionStatus> askPermission(PermissionGroup permission) async {
    var permissionToStatus =
        await permissionHandler.requestPermissions([permission]);
    return permissionToStatus[permission];
  }

  static Future<PermissionStatus> checkPermissionStatus(
      PermissionGroup permission) {
    return permissionHandler.checkPermissionStatus(permission);
  }
}
