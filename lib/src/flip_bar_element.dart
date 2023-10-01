import 'package:bottom_navbar/src/flip_box.dart';
import 'package:flutter/material.dart';

class FlipBarElement extends StatefulWidget {
  final Widget icon;
  final Widget text;
  final Color frontColor;
  final Color backColor;
  final AnimationController controller;
  final ValueChanged<int> onTapped;
  final index;
  final double appBarHeight;
  const FlipBarElement(
      {super.key,
      required this.icon,
      required this.text,
      required this.frontColor,
      required this.backColor,
      required this.controller,
      required this.onTapped,
      required this.index,
      required this.appBarHeight});

  @override
  State<FlipBarElement> createState() => _FlipBarElementState();
}

class _FlipBarElementState extends State<FlipBarElement> {
  @override
  Widget build(BuildContext context) {
    return FlipBox(
      controller: widget.controller,
      bottomChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.backColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [widget.icon, widget.text],
        ),
      ),
      topChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.frontColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [widget.icon],
        ),
      ),
      onTapped: () {
        widget.onTapped(widget.index);
      },
      heihgt: widget.appBarHeight,
    );
  }
}
