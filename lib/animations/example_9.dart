import 'dart:math';

import 'package:flutter/material.dart';

class AnimationNine extends StatefulWidget {
  const AnimationNine({Key? key}) : super(key: key);

  @override
  State<AnimationNine> createState() => _AnimationNineState();
}

class _AnimationNineState extends State<AnimationNine>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  late Animation<double> _angleAnimation;
  late Animation sizeAnimation;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..forward();
    _scaleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _scaleController.forward();
        }
      })
      ..forward();
    sizeAnimation =
        Tween<double>(begin: 100.0, end: 300.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
      reverseCurve: Curves.bounceIn,
    ))
          ..addListener(() {});
    _animation = CurvedAnimation(
      reverseCurve: Curves.bounceOut,
      parent: _scaleController,
      curve: Curves.bounceIn,
    )..addListener(() {
        // _scaleController.repeat();
      });

    _angleAnimation = Tween<double>(begin: 0.0, end: 2 * pi)
        .chain(CurveTween(curve: Curves.linear))
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Transform.rotate(
            angle: _angleAnimation.value,
            child: SizedBox(
              height: 120,
              width: 120,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
