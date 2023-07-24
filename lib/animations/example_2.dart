import 'package:flutter/material.dart';

class AnimationTwo extends StatefulWidget {
  const AnimationTwo({Key? key}) : super(key: key);

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo>
    with TickerProviderStateMixin {
  bool upto = false;

  bool rightto = false;
  double height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EX 2"),
      ),
      body: Column(children: [
        Expanded(
          flex: 9,
          child: Stack(
            children: [
              AnimatedPositioned(
                  left: rightto ? 10 : 250,
                  right: rightto ? 250 : 10,
                  top: upto ? 10 : 400,
                  bottom: upto ? 400 : 10,
                  curve: Curves.linear,
                  duration: upto
                      ? Duration(seconds: 1.5.toInt())
                      : Duration(seconds: 1.5.toInt()),
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    upto = true;
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_up,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rightto = true;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rightto = false;
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    upto = false;
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
