import 'package:bottom_navbar/src/flip_bar_item.dart';
import 'package:bottom_navbar/src/flip_box_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(),
      bottomNavigationBar: FlipBoxBar(
          items: [
            FlipBarItem(
                icon: const Icon(Icons.map),
                text: const Text("Map"),
                frontColor: Colors.blue,
                backColor: Colors.blueAccent),
            FlipBarItem(
                icon: const Icon(Icons.add),
                text: const Text("Add"),
                frontColor: Colors.cyan,
                backColor: Colors.cyanAccent),
            FlipBarItem(
                icon: const Icon(Icons.chrome_reader_mode),
                text: const Text("Read"),
                frontColor: Colors.orange,
                backColor: Colors.orangeAccent),
            FlipBarItem(
                icon: const Icon(Icons.print),
                text: const Text("Print"),
                frontColor: Colors.purple,
                backColor: Colors.purpleAccent),
            FlipBarItem(
                icon: const Icon(Icons.account_circle),
                text: const Text("Profile"),
                frontColor: Colors.pink,
                backColor: Colors.pinkAccent),
          ],
          onIndexChanged: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          selectedIndex: selectedIndex),
    );
  }
}
