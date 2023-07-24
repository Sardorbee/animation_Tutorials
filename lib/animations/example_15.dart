import 'package:flutter/material.dart';

class AnimationFifteen extends StatefulWidget {
  const AnimationFifteen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationFifteenState createState() => _AnimationFifteenState();
}

class _AnimationFifteenState extends State<AnimationFifteen>
    with TickerProviderStateMixin {
  late Animation<Decoration> decorationTween;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    decorationTween = DecorationTween(
      begin: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border:
            Border.all(style: BorderStyle.none, color: Colors.black, width: 5),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x66666666),
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(0, 6.0),
          )
        ],
      ),
      end: BoxDecoration(
        color: const Color.fromARGB(255, 9, 9, 9),
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.none,
        ),

        // No shadow.
      ),
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container Demo'),
      ),
      body: Center(
          child: DecoratedBoxTransition(
              decoration: decorationTween,
              child: const SizedBox(
                height: 200,
                width: 200,
                child: FlutterLogo(),
              ))),
    );
  }
}
