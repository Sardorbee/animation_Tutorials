import 'package:flutter/material.dart';
import 'dart:math';

class AnimationEighteen extends StatefulWidget {
  const AnimationEighteen({Key? key}) : super(key: key);

  @override
  State<AnimationEighteen> createState() => _AnimationEighteenState();
}

class _AnimationEighteenState extends State<AnimationEighteen>
    with SingleTickerProviderStateMixin {
  bool _first = false;
  late AnimationController _controller;
  int targetValue = 99;
  Color _boxColor = Colors.blue; // Initialize with a default color

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Number Counting"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 50,
                    width: 340,
                    color: Colors.blue[200], // Use the _boxColor for the box
                  ),
                ),
                AnimatedPositioned(
                  left: 0,
                  width: _first ? 340 : 0,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 50,
                    color: _boxColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                int currentValue =
                    (_controller.value * (targetValue + 1)).floor();
                return Text(
                  "$currentValue %",
                  style: const TextStyle(fontSize: 48),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_first) {
                  _controller.reverse(from: 1.0);
                } else {
                  _controller.forward(from: 0.0);
                }
                setState(() {
                  _first = !_first;
                  _boxColor = getRandomColor(); // Generate a new random color
                });
              },
              child: Text(
                _first ? 'Stop Animation' : 'Start Animation',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
