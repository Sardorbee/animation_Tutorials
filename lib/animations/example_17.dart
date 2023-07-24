import 'package:flutter/material.dart';

class AnimationSeventeen extends StatefulWidget {
  const AnimationSeventeen({Key? key}) : super(key: key);

  @override
  State<AnimationSeventeen> createState() => _AnimationSeventeenState();
}

class _AnimationSeventeenState extends State<AnimationSeventeen> {
  bool _first = true;
  double _fontSize = 20;

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
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "Animation !^6lasdlkjfioansgjnanubgnaioerkvmaiofkmaoinvajnvaufoupiqhjfivar",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fontSize = _first ? 70 : 20;

                    _first = !_first;
                  });
                },
                child: const Text('Bigger')),
          ],
        ),
      ),
    );
  }
}
