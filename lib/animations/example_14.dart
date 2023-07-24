import 'dart:async';

import 'package:flutter/material.dart';

class AnimationFourteen extends StatefulWidget {
  const AnimationFourteen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationFourteenState createState() => _AnimationFourteenState();
}

class _AnimationFourteenState extends State<AnimationFourteen> {
  bool _isCircle = false;
  Timer? _timer;

  void _toggleShape() {
    if (context.mounted) {
      setState(() {
        _isCircle = !_isCircle;
      });
    }
  }

  @override
  void initState() {
    _toggleShape();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _toggleShape();
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container Demo'),
      ),
      body: Center(
        child: AnimatedPhysicalModel(
          animateShadowColor: true,
          animateColor: true,
          duration: const Duration(milliseconds: 3),
          curve: Curves.linear,
          elevation: _isCircle ? 50 : 30,
          shape: BoxShape.circle,
          shadowColor: Colors.black,
          color: Colors.grey,
          borderRadius: _isCircle
              ? const BorderRadius.all(Radius.circular(0))
              : const BorderRadius.all(Radius.circular(300)),
          child: AnimatedContainer(
            decoration: BoxDecoration(
                color: _isCircle
                    ? Colors.red
                    : Colors.green, // Replace this with your desired color
                borderRadius: BorderRadius.circular(250.0)),
            padding: EdgeInsets.all(_isCircle ? 10 : 60),
            width: 250.0,
            height: 250.0,
            duration: const Duration(seconds: 3),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              width: 240.0,
              height: 240.0,
              decoration: BoxDecoration(
                  color: _isCircle
                      ? Colors.blue
                      : Colors.yellow, // Replace this with your desired color
                  borderRadius: BorderRadius.circular(250.0)),
            ),
          ),
        ),
      ),
    );
  }
}
