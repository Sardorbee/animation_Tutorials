import 'dart:async';

import 'package:flutter/material.dart';

class AnimationTheerteen extends StatefulWidget {
  const AnimationTheerteen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationTheerteenState createState() => _AnimationTheerteenState();
}

class _AnimationTheerteenState extends State<AnimationTheerteen> {
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
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
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
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: _isCircle
                ? Colors.red
                : Colors.green, // Replace this with your desired color
            borderRadius: _isCircle
                ? BorderRadius.circular(250.0)
                : BorderRadius.circular(0.0),
          ),
          padding: EdgeInsets.all(_isCircle ? 0 : 20),
          width: 250.0,
          height: 250.0,
          duration: const Duration(seconds: 4),
          child: AnimatedContainer(
            duration: const Duration(seconds: 4),
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: _isCircle
                  ? Colors.blue
                  : Colors.yellow, // Replace this with your desired color
              borderRadius: _isCircle
                  ? BorderRadius.circular(250.0)
                  : BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
