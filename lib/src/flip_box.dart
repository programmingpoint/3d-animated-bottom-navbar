import 'dart:math';

import 'package:flutter/material.dart';

class FlipBox extends StatefulWidget {
  final Widget bottomChild;
  final Widget topChild;
  final double heihgt;
  final AnimationController controller;
  final VoidCallback onTapped;

  const FlipBox(
      {super.key,
      required this.bottomChild,
      required this.topChild,
      this.heihgt = 100,
      required this.controller,
      required this.onTapped});

  @override
  State<FlipBox> createState() => _FlipBoxState();
}

class _FlipBoxState extends State<FlipBox> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 2000));
    } else {
      controller = widget.controller;
    }
    animation = Tween(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heihgt,
      width: double.infinity,
      child: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -(cos(animation.value) * (widget.heihgt / 2)),
                  ((-widget.heihgt / 2) * sin(animation.value)))
              ..rotateX(-(pi / 2) + animation.value),
            child: Container(
              child: Center(
                child: widget.bottomChild,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onTapped();
              controller.forward();
            },
            child: animation.value < (85 * pi / 180)
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(
                          0.0,
                          (widget.heihgt / 2) * sin(animation.value),
                          -((widget.heihgt / 2) * cos(animation.value)))
                      ..rotateX(animation.value),
                    child: Container(
                      child: Center(
                        child: widget.topChild,
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
