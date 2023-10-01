import 'package:flutter/material.dart';

class FlipBarItem {
  final Widget icon;
  final Widget text;
  final Color frontColor;
  final Color backColor;

  FlipBarItem(
      {required this.icon,
      required this.text,
      this.frontColor = Colors.blueAccent,
      this.backColor = Colors.blue});
}
