import 'package:flutter/material.dart';

class AnimationSeveen extends StatefulWidget {
  const AnimationSeveen({Key? key}) : super(key: key);

  @override
  State<AnimationSeveen> createState() => _AnimationSeveenState();
}

class _AnimationSeveenState extends State<AnimationSeveen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isS = !isS;
          });
        },
        child: const Icon(Icons.flip),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Center(
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: isS ? 0 : 1.0,
                duration: const Duration(seconds: 1),
                child: Container(
                  color: Colors.blue,
                  height: 250,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
