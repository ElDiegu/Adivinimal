import 'dart:io';

import 'animal.dart';
import 'package:flutter/cupertino.dart';

class AnimalDataBase {
  List<Animal> animals = [];
  
  void addAnimal(String name, ImageProvider image, List<String> c1, List<String> c2, List<String> c3, int c4, List<String> c5){
    final newAnimal = Animal(name, image, c1, c2, c3, c4, c5);
    animals.add(newAnimal);
  }

  AnimalDataBase() {
    addAnimal("León",
          AssetImage('assets/naranja.png'),
          ['Papopepo', 'Mercedes', 'E'],
          ['Papopepo', 'Mercedes', 'E'],
          ['Papopepo', 'Mercedes', 'E'],
          15,
          ['Papopepo', 'Mercedes', 'E']);
    stderr.writeln(animals[0].name);
    addAnimal("Ganso Blanco",
        AssetImage('assets/naranja.png'),
        ['Papopepo', 'Mercedes', 'E'],
        ['Papopepo', 'Mercedes', 'E'],
        ['Papopepo', 'Mercedes', 'E'],
        15,
        ['Papopepo', 'Mercedes', 'E']);
    addAnimal("Flamenco",
        AssetImage('assets/naranja.png'),
        ['Papopepo', 'Mercedes', 'E'],
        ['Papopepo', 'Mercedes', 'E'],
        ['Papopepo', 'Mercedes', 'E'],
        15,
        ['Papopepo', 'Mercedes', 'E']);
  }
}