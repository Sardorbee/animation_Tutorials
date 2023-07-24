import 'package:flutter/material.dart';

class AnimationTenn extends StatefulWidget {
  const AnimationTenn({Key? key}) : super(key: key);

  @override
  State<AnimationTenn> createState() => _AnimationTennState();
}

class _AnimationTennState extends State<AnimationTenn> {
  AlignmentGeometry align = Alignment.topCenter;
  AlignmentGeometry secalign = Alignment.bottomLeft;
  AlignmentGeometry thirdalign = Alignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          align = align == Alignment.topCenter
              ? Alignment.bottomCenter
              : align = Alignment.topCenter;
          secalign = secalign == Alignment.bottomLeft
              ? Alignment.topRight
              : secalign = Alignment.bottomLeft;
          thirdalign = thirdalign == Alignment.bottomRight
              ? Alignment.topLeft
              : thirdalign = Alignment.bottomRight;
        });
      }),
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Stack(
                children: [
                  AnimatedAlign(
                    curve: Curves.bounceInOut,
                    alignment: align,
                    duration: const Duration(seconds: 3),
                    onEnd: () {},
                    child: Container(
                      color: Colors.red,
                      child: const Text(
                        'Annimat',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    curve: Curves.bounceInOut,
                    alignment: secalign,
                    duration: const Duration(seconds: 3),
                    onEnd: () {},
                    child: Container(
                      color: Colors.red,
                      child: const Text(
                        'Annimat',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    curve: Curves.bounceInOut,
                    alignment: thirdalign,
                    duration: const Duration(seconds: 3),
                    onEnd: () {},
                    child: Container(
                      color: Colors.red,
                      child: const Text(
                        'Annimat',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
