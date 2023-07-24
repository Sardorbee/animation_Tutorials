import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPractice extends StatefulWidget {
  const AnimationPractice({Key? key}) : super(key: key);

  @override
  State<AnimationPractice> createState() => _AnimationPracticeState();
}

class _AnimationPracticeState extends State<AnimationPractice>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool a = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: 2 * pi, end: 0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.forward();

    super.initState();
  }

  bool gg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a = !a;
          });
        },
        child: AnimatedScale( scale:a?2: 1,onEnd: () => animationController.reverse(),
          duration: const Duration(
            seconds: 2,
          ),
          curve: Curves.bounceInOut,
          child: const Icon(
            Icons.emoji_emotions,
            
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: animation.value,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterLogo(
                          size: 100,
                        ),
                        FlutterLogo(
                          size: 100,
                        ),
                      ],
                    ),
                    FlutterLogo(
                      size: 100,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
