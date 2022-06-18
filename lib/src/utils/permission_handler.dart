// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:dang/src/utils/custom_toast.dart';
import 'package:dang/src/utils/showPermissionDialog.dart';

class PermissionService {
  late final String _permissionDeniedTitle = "Permission Denied";
  late final String _permissionDeniedContent = "Do you want to Open Settings?";

  Future<void> checkPermission(
      BuildContext context, Permission permission) async {
    final status = await permission.request();
    print(status);
    if (status == PermissionStatus.granted) {
      print('Permission granted');
    } else if (status == PermissionStatus.denied) {
      print(
          'Permission denied. Show a dialog and again ask for the permission');
      CustomToast.instance.showToast(
        context,
        message: "Permission Denied",
        backgroundColor: Colors.red,
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Take the user to the settings page.');

      dialogBox(
        context,
        _permissionDeniedTitle,
        _permissionDeniedContent,
      );
    } else if (status == PermissionStatus.restricted) {
      print('restriced');
      dialogBox(
        context,
        _permissionDeniedTitle,
        _permissionDeniedContent,
      );
    } else if (status == PermissionStatus.limited) {
      print('Permission status limited');
    }
  }

  dialogBox(
    BuildContext context,
    String title,
    String content,
  ) {
    ShowDialogBox.dialogBox(
      context,
      _permissionDeniedTitle,
      _permissionDeniedContent,
      onPress: () {
        openAppSettings();
      },
      onCancel: () {
        CustomToast.instance.showToast(
          context,
          message: "Permission Denied",
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
