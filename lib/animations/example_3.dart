import 'dart:math';
import 'package:flutter/material.dart';

class AnimationThree extends StatefulWidget {
  const AnimationThree({Key? key}) : super(key: key);

  @override
  State<AnimationThree> createState() => _AnimationOneStThree();
}

class _AnimationOneStThree extends State<AnimationThree> {
  double width = 100.0;
  double height = 100.0;
  double rrr = 10.0;
  Color colors = Colors.green;
  int _counter = 0;

  void _changeContainerProperties() {
    setState(() {
      if (_counter < 7) {
        width = Random().nextInt(350).toDouble() + 50;
        height = Random().nextInt(550).toDouble() + 20;
        rrr = Random().nextInt(32).toDouble() + 10;
        colors = Color.fromRGBO(
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
          1.0,
        );

        _counter++;
      } else {
        width = 100.0;
        height = 100.0;
        rrr = 10.0;
        colors = Colors.green;
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeContainerProperties();
      }),
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(
            rrr,
          ),
        ),
        height: height,
        width: width,
        child: const SizedBox(),
      )),
    );
  }
}
