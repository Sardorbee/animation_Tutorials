import 'package:animation_aalll/animations/providerTraining/kinolar_model.dart';
import 'package:animation_aalll/animations/providerTraining/provider-training-2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTrain extends StatelessWidget {
  const ProviderTrain({super.key});

  @override
  Widget build(BuildContext context) {
    var kinos = context.watch<KinoProvider>().kinolar;
    var likes = context.watch<KinoProvider>().liked;
    var carts = context.watch<SavatProvider>().savatga;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Contaienrrr(),
                        ));
                  },
                  child: Text("Liked items: ${likes.length}"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SavatContaienrrr(),
                        ));
                  },
                  child: Text("Carted items: ${carts.length}"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: kinos.length,
                itemBuilder: (BuildContext context, int index) {
                  Kinolar kino = kinos[index];
                  return ListTile(
                    leading: IconButton(
                      onPressed: () {
                        if (!carts.contains(kino)) {
                          context.read<SavatProvider>().addtoCart(kino);
                        } else {
                          context.read<SavatProvider>().removeFromCart(kino);
                        }
                      },
                      icon: const Icon(Icons.shopping_basket_outlined),
                      color: carts.contains(kino) ? Colors.red : Colors.black38,
                    ),
                    title: Text(kino.name!),
                    subtitle: Text(kino.duration!),
                    trailing: IconButton(
                      onPressed: () {
                        if (!likes.contains(kino)) {
                          context.read<KinoProvider>().addtoList(kino);
                        } else {
                          context.read<KinoProvider>().removeFrom(kino);
                        }
                      },
                      icon: const Icon(Icons.favorite),
                      color: likes.contains(kino) ? Colors.red : Colors.black38,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contaienrrr extends StatelessWidget {
  const Contaienrrr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.watch<KinoProvider>().liked;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                Kinolar data = list[index];
                return ListTile(
                  title: Text(data.name!),
                  subtitle: Text(data.duration!),
                  trailing: TextButton(
                      child: const Text('Remove'),
                      onPressed: () {
                        context.read<KinoProvider>().removeFrom(data);
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SavatContaienrrr extends StatelessWidget {
  const SavatContaienrrr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.watch<SavatProvider>().savatga;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                Kinolar data = list[index];
                return ListTile(
                  title: Text(data.name!),
                  subtitle: Text(data.duration!),
                  trailing: TextButton(
                      child: const Text('Remove'),
                      onPressed: () {
                        context.read<SavatProvider>().removeFromCart(data);
                      }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
