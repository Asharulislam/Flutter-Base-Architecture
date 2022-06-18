// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dang/src/enums/index.dart';

class CustomToast {
  String? _message;
  Color? _color;

  CustomToast._();
  static final CustomToast _singleton = CustomToast._();

  static CustomToast get instance => _singleton;

  FToast fToast = FToast();
  void initialize(BuildContext context) {
    print('Initialized Custom Toast');
    fToast.init(context);
  }

  void showToast(
    context, {
    Color backgroundColor = Colors.blue,
    required String message,
    Color messageColor = Colors.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: backgroundColor,
        ),
        child: Text(message, style: TextStyle(color: messageColor)),
      ),
      gravity: gravity,
      toastDuration: const Duration(seconds: 3),
    );
  }

  connectionToast(BuildContext context, ConnectivityStatus result) {
    fToast.removeQueuedCustomToasts();

    if (result == ConnectivityStatus.cellular ||
        result == ConnectivityStatus.wifi) {
      _message = 'Active Connection';
      _color = Colors.green;
    } else if (result == ConnectivityStatus.offline) {
      _message = 'No Connection';
      _color = Colors.red;
    }
    showToast(context, message: _message!, backgroundColor: _color!);
  }
}
