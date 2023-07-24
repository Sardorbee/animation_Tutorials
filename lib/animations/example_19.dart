import 'package:flutter/material.dart';

class AnimationNineteen extends StatefulWidget {
  const AnimationNineteen({Key? key}) : super(key: key);

  @override
  State<AnimationNineteen> createState() => _AnimationNineteenState();
}

class _AnimationNineteenState extends State<AnimationNineteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'heroIcon',
              child: Icon(
                Icons.local_dining_sharp,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Hero(
            tag: 'heroIcon',
            child: Icon(
              Icons.local_dining_sharp,
              size: 25,
            ),
          ),
        ],
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
