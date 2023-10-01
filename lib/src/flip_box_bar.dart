import 'package:bottom_navbar/src/flip_bar_element.dart';
import 'package:bottom_navbar/src/flip_bar_item.dart';
import 'package:flutter/material.dart';

class FlipBoxBar extends StatefulWidget {
  final List<FlipBarItem> items;
  final Duration animationDuration;
  final ValueChanged<int> onIndexChanged;
  final int selectedIndex;
  final double navBarHeight;
  const FlipBoxBar(
      {super.key,
      required this.items,
      this.animationDuration = const Duration(seconds: 1),
      required this.onIndexChanged,
      required this.selectedIndex,
      this.navBarHeight = 100.0});

  @override
  State<FlipBoxBar> createState() => _FlipBoxBarState();
}

class _FlipBoxBarState extends State<FlipBoxBar> with TickerProviderStateMixin {
  final List<AnimationController> _controller = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.items.length; i++) {
      _controller.add(
          AnimationController(vsync: this, duration: widget.animationDuration));
    }
    _controller[widget.selectedIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    _changeValue();
    return SizedBox(
      height: 100,
      child: Row(
          children: widget.items.map((item) {
        int index = widget.items.indexOf(item);
        return Expanded(
            child: FlipBarElement(
                icon: item.icon,
                text: item.text,
                frontColor: item.frontColor,
                backColor: item.backColor,
                controller: _controller[index],
                onTapped: (index) {
                  _changeValue();
                  widget.onIndexChanged(index);
                },
                index: index,
                appBarHeight: widget.navBarHeight));
      }).toList()),
    );
  }

  void _changeValue() {
    for (var controller in _controller) {
      controller.reverse();
    }
    _controller[widget.selectedIndex].forward();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controller) {
      controller.dispose();
    }
  }
}
