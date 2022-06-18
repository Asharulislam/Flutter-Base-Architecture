import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.softWrap,
  }) : super(key: key);

  final String text;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).textTheme.subtitle2!.color,
        fontSize: Theme.of(context).textTheme.subtitle2!.fontSize,
      ),
      softWrap: softWrap,
    );
  }
}
