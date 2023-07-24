import 'package:flutter/material.dart';

class AnimationEight extends StatefulWidget {
  const AnimationEight({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimationEightState createState() => _AnimationEightState();
}

class _AnimationEightState extends State<AnimationEight>
    with TickerProviderStateMixin {
  double _size = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Size'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.blue,width: 5),
              ),
              child: AnimatedSize(
                duration: const Duration(seconds: 2),
                child: Container(
                  width: _size,
                  height: _size,
                  color: Colors.red,
                  // color: Colors.teal,
                  child: const FlutterLogo(),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: const Text(
                'Change Size',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _size = _size == 150 ? 250 : 150;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
