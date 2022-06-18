import 'package:flutter/material.dart';

import 'package:dang/src/ui/widgets/index.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double? elevation;
  final Color? backgroundColor;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.elevation = 2,
    this.backgroundColor = const Color(0x00000000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: TextWidget(text: text),
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        enableFeedback: true,
        primary: backgroundColor,
      ),
    );
  }
}
