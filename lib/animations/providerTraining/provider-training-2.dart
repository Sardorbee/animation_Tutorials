import 'dart:math';

import 'package:animation_aalll/animations/providerTraining/kinolar_model.dart';
import 'package:flutter/material.dart';

final List<Kinolar> kinolist = List.generate(
  50,
  (index) => Kinolar(
      duration: "${Random().nextInt(120) + 50} minutes", name: 'Kino $index'),
);

class KinoProvider with ChangeNotifier {
  final List<Kinolar> _kinolar = kinolist;

  List<Kinolar> get kinolar => _kinolar;
  final List<Kinolar> _liked = [];

  List<Kinolar> get liked => _liked;

  void addtoList(Kinolar kinno) {
    _liked.add(kinno);
    notifyListeners();
  }

  void removeFrom(Kinolar kinno) {
    _liked.remove(kinno);
    notifyListeners();
  }
}

class SavatProvider with ChangeNotifier {
  final List<Kinolar> _savatga = [];
  List<Kinolar> get savatga => _savatga;
  void addtoCart(Kinolar kinno) {
    _savatga.add(kinno);
    notifyListeners();
  }

  void removeFromCart(Kinolar kinno) {
    _savatga.remove(kinno);
    notifyListeners();
  }
}
