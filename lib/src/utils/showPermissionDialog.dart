// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogBox {
  static void dialogBox(context, title, content,
      {required Function onPress, required Function onCancel}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  CupertinoDialogAction(
                    child: const Text("No",
                        style: TextStyle(
                          color: Colors.red,
                        )),
                    onPressed: () {
                      Navigator.of(context).pop();
                      onCancel();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Yes",
                    ),
                    onPressed: () {
                      onPress();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onCancel();
                    },
                    child: const Text('No',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      onPress();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
      },
    );
  }
}
