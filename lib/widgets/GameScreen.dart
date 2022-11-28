import 'dart:math';
import 'package:adivinimal/animal_data/animal_database.dart';
import 'package:adivinimal/animal_data/animal.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import "package:unorm_dart/unorm_dart.dart" as unorm;
import 'package:collection/collection.dart';
import 'package:adivinimal/animal_data/animal_compare.dart';

class GameScreen extends StatefulWidget{
  GameScreen({super.key});

  @override
  _GameScreen createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen>{
  AnimalDataBase animalDataBase = AnimalDataBase();
  late Animal selectedAnimal;
  final GlobalKey<_AnswerListState> _key = GlobalKey();
  int tries = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text(tries.toString()),
            Autocomplete<Animal>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if(textEditingValue.text.isEmpty) return const Iterable<Animal>.empty();
                  return animalDataBase.animals.where((Animal animal) => removeDiacritics(animal.name.toLowerCase()).contains(removeDiacritics(textEditingValue.text.toLowerCase())));
                },
                displayStringForOption: (Animal obj) => obj.name,
                onSelected: (Animal selected) {
                  selectedAnimal = selected;
                }
            ),
            ElevatedButton(
                onPressed: () {
                  if(selectedAnimal == null) return;
                  _key.currentState!.addAnswer(selectedAnimal);
                },
                child: Text('Confirmar animal')
            ),
            AnswerList(key: _key,function: addTry),
          ],
        ),
      ),
    );
  }

  addTry() => setState(() => tries++);
}

class AnswerList extends StatefulWidget{
  AnswerList({super.key, required this.function});

  final VoidCallback function;

  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList>{
  late List<Animal> answers = [];
  final animal = AnimalDataBase().animals[Random().nextInt(AnimalDataBase().animals.length)];

  @override
  Widget build(BuildContext context) {
    return Flexible(child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: answers.length,
      itemBuilder: (context, index) => AnimalCompareWidget(
          originalAnimal: animal,
          animalChosen: answers[index]
      ),
    ));
  }

  addAnswer(Animal animal) {answers.add(animal); print('child method'); widget.function();}
}