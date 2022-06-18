import 'package:flutter/material.dart';
import 'package:dang/src/enums/index.dart';

class Utils {
  String? _message;
  Color? _color;

  void showSnackBar(BuildContext context, ConnectivityStatus result) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _message!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: _color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
