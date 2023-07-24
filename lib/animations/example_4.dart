
import 'package:flutter/material.dart';

class AnimationFour extends StatefulWidget {
  const AnimationFour({Key? key}) : super(key: key);

  @override
  State<AnimationFour> createState() => _AnimationFourState();
}

class _AnimationFourState extends State<AnimationFour>
    with TickerProviderStateMixin {
  bool gg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              height: 200,
              width: 200,
              color: gg ? Colors.amber : Colors.green,
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.linear,
              child: Center(
                  child: Stack(children: [
                    
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: gg ? 1.0 : 0,
                  child: const Text(
                    "This is Second widget",
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: gg ? 0 : 1.0,
                  child: const Text(
                    "This is First widget",
                  ),
                ),
              ])),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    gg = !gg;
                  });
                },
                child: const Text("click Hereee"))
          ],
        ),
      ),
    );
  }
}
