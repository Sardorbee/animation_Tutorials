import 'package:flutter/material.dart';

class AnimationSixteen extends StatefulWidget {
  const AnimationSixteen({Key? key}) : super(key: key);

  @override
  State<AnimationSixteen> createState() => _AnimationSixteenState();
}

class _AnimationSixteenState extends State<AnimationSixteen> {
  bool _first = true;
  double _fontSize = 20;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDefaultTextStyle"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "Animation !^6",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _fontSize = 70;
                  _color = Colors.red;
                  _first = !_first;
                });
              },
              child: const Icon(
                Icons.play_arrow,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _fontSize = 20;
                  _color = Colors.blue;
                  _first = !_first;
                });
              },
              child: const Icon(
                Icons.settings_backup_restore_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
