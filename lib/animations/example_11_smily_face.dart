import 'package:flutter/material.dart';

class AnimationSmilee extends StatefulWidget {
  const AnimationSmilee({Key? key}) : super(key: key);

  @override
  State<AnimationSmilee> createState() => _AnimationSmileeState();
}

class _AnimationSmileeState extends State<AnimationSmilee> {
  AlignmentGeometry align = Alignment.topCenter;
  bool isMouthOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          align = align == Alignment.topCenter
              ? Alignment.bottomCenter
              : align = Alignment.topCenter;
          isMouthOpen = !isMouthOpen;
        });
      }),
      appBar: AppBar(
        title: const Text('Animated Facee'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    top: 80,
                    left: 125,
                    height: isMouthOpen ? 25 : 15,
                    width: 55,
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    right: 125,
                    top: 80,
                    height: isMouthOpen ? 25 : 15,
                    width: 55,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    right: 145,
                    top: 200,
                    curve: Curves.bounceInOut,
                    duration: const Duration(seconds: 1),
                    child: AnimatedContainer(
                      curve: Curves.bounceInOut,
                      duration: const Duration(milliseconds: 250),
                      height: isMouthOpen ? 45 : 15,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(
                              15,
                            ),
                            topRight: const Radius.circular(
                              15,
                            ),
                            bottomLeft: Radius.circular(
                              isMouthOpen ? 150 : 15,
                            ),
                            bottomRight: Radius.circular(
                              isMouthOpen ? 150 : 15,
                            )),
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // AnimatedAlign(
                  //   curve: Curves.bounceInOut,
                  //   alignment: align,
                  //   duration: Duration(seconds: 3),
                  //   onEnd: () {},
                  //   child: Container(
                  //     color: Colors.red,
                  //     child: const Text(
                  //       'Annimat',
                  //       style: TextStyle(color: Colors.white, fontSize: 25),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
