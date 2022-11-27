import 'package:adivinimal/animal_data/animal_database.dart';
import 'package:adivinimal/animal_data/animal.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import "package:unorm_dart/unorm_dart.dart" as unorm;
import 'package:collection/collection.dart';
import 'package:adivinimal/animal_data/animal_compare.dart';

class GameSceen extends StatelessWidget{

  final animalDatabase = AnimalDataBase();

  var combining = RegExp(r"[\u0301]", unicode: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Autocomplete<Animal>(
                optionsBuilder: (TextEditingValue textEditingValue){
                  if(textEditingValue.text.isEmpty) return const Iterable<Animal>.empty();
                  else{
                    return animalDatabase.animals.where((Animal animal) => removeDiacritics(animal.name.toLowerCase()).contains(removeDiacritics(textEditingValue.text.toLowerCase())));
                  }
                },
                displayStringForOption: (Animal obj) => obj.name,
              )
          )
      ),
    );
  }
}