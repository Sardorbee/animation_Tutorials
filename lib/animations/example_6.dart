import 'package:flutter/material.dart';

class AnimationSixx extends StatefulWidget {
  const AnimationSixx({Key? key}) : super(key: key);

  @override
  State<AnimationSixx> createState() => _AnimationSixxState();
}

class _AnimationSixxState extends State<AnimationSixx>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform.rotate"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Center(
          child: Stack(
            children: [
              AnimatedPositioned(
                left: isS ? 150 : 5,
                right: isS ? 150 : 5,
                duration: const Duration(seconds: 1),
                height: 100,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isS = !isS;
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 250,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
