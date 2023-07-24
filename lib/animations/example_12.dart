import 'package:flutter/material.dart';

class AnimationTwelwe extends StatefulWidget {
  const AnimationTwelwe({Key? key}) : super(key: key);

  @override
  State<AnimationTwelwe> createState() => _AnimationTwelweState();
}

class _AnimationTwelweState extends State<AnimationTwelwe> {
  AlignmentGeometry align = Alignment.topLeft;
  bool iss = false;
  bool izz = false;

  AlignmentGeometry thirdalign = Alignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              color: Colors.blue,
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: izz ? 0 : 1.0,
                    duration: const Duration(milliseconds: 1),
                    child: AnimatedAlign(
                      curve: Curves.linear,
                      alignment: align,
                      duration: const Duration(seconds: 3),
                      onEnd: () {},
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            align = align == Alignment.topLeft
                                ? Alignment.bottomRight
                                : Alignment.topLeft;

                            thirdalign = thirdalign == Alignment.bottomRight
                                ? Alignment.topLeft
                                : Alignment.bottomRight;
                            iss = !iss;
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              setState(() {
                                iss = !iss;
                              });
                            });
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          width: align == Alignment.bottomRight ? 200 : 100,
                          color: Colors.red,
                          child: const Text(
                            'Annimat',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: iss ? 0 : 1.0,
                    duration: const Duration(milliseconds: 1),
                    child: AnimatedAlign(
                      curve: Curves.linear,
                      alignment: thirdalign,
                      duration: const Duration(seconds: 3),
                      onEnd: () {},
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            align = align == Alignment.topLeft
                                ? Alignment.bottomRight
                                : Alignment.topLeft;

                            thirdalign = thirdalign == Alignment.bottomRight
                                ? Alignment.topLeft
                                : Alignment.bottomRight;
                            izz = !izz;
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              setState(() {
                                izz = !izz;
                              });
                            });
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          width:
                              thirdalign == Alignment.bottomRight ? 200 : 100,
                          color: Colors.red,
                          child: const Text(
                            'Annimat',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
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
