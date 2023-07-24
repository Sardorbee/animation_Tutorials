import 'package:animation_aalll/animations/list.dart';
import 'package:animation_aalll/animations/providerTraining/provider-training-2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<KinoProvider>(
          create: (x) => KinoProvider(),
        ),
        ChangeNotifierProvider<SavatProvider>(
          create: (x) => SavatProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                final p = pages[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => p,
                      )),
                  child: ListTile(
                    title: Text("${p.toString()}        $index"),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
