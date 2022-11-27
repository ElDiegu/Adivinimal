import 'package:adivinimal/animal_data/animal_database.dart';
import 'package:flutter/material.dart';
import 'package:adivinimal/animal_data/animal_compare.dart';

class AnimalPruebas extends StatelessWidget{
  AnimalDataBase animalDataBase = AnimalDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
              //padding: const EdgeInsets.all(8),
              children: <Widget>[
                AnimalCompareWidget(originalAnimal: animalDataBase.animals[1] ,animalChosen: animalDataBase.animals[0])
              ],
            )
        )
    );
  }
}