import 'dart:math';
import 'package:flutter/material.dart';

class AnimationOne extends StatefulWidget {
  const AnimationOne({Key? key}) : super(key: key);

  @override
  State<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isPlaying = false; // Add a boolean to track the animation state

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: 2 * pi, end: 0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ));
    animation.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  void playAnimation() {
    if (animationController.isCompleted) {
      animationController.reset();
    }
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (!isPlaying) {
                  playAnimation(); // Play the animation when the button is pressed
                  isPlaying = true; // Set the animation state to playing
                }
              });
            },
            child: const Icon(Icons.play_arrow),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  animationController
                      .stop(); // Stop the animation when the button is pressed
                  isPlaying = false; // Set the animation state to not playing
                }
              });
            },
            child: const Icon(Icons.square),
          ),
        ],
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: const Icon(
            Icons.square,
            color: Colors.blue,
            size: 250,
          ),
        ),
      ),
    );
  }
}
