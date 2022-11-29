import 'dart:math';
import 'package:adivinimal/animal_data/animal_database.dart';
import 'package:adivinimal/animal_data/animal.dart';
import 'package:adivinimal/data/game.dart';
import 'package:adivinimal/widgets/Settings.dart';
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
  final animal = AnimalDataBase().animals[Random().nextInt(AnimalDataBase().animals.length)];
  final GlobalKey<_AnswerListState> _key = GlobalKey();
  int tries = 0;
  late int maxTries = getTries();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text('Intentos: $tries/$maxTries'),
            Autocomplete<Animal>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if(textEditingValue.text.isEmpty) return const Iterable<Animal>.empty();
                  return autocomplete(textEditingValue.text);
                },

                displayStringForOption: (Animal obj) => obj.name,
                onSelected: (Animal selected) {
                  selectedAnimal = selected;
                  FocusManager.instance.primaryFocus?.unfocus();
                }
            ),
            ElevatedButton(
                onPressed: () {
                  if(selectedAnimal == null) return;
                  FocusManager.instance.primaryFocus?.unfocus();
                  _key.currentState!.addAnswer(selectedAnimal);
                  if(selectedAnimal == animal){
                    showDialog(
                      context: context,
                      builder: (context) => EndGame(tries: tries, animal: animal, victoria: true),
                    );
                    return;
                  }
                  if(tries == maxTries){
                    showDialog(
                      context: context,
                      builder: (context) => EndGame(tries: tries, animal: animal, victoria: false),
                    );
                  }
                },
                child: Text('Confirmar animal')
            ),
            AnswerList(key: _key,function: addTry, animal: animal,),
          ],
        ),
      ),
    );
  }

  addTry() => setState(() => tries++);

  int getTries(){
    if(SettingsWidget.opcion5!) return 5;
    if(SettingsWidget.opcion7!) return 7;
    if(SettingsWidget.opcion10!) return 10;
    return 5;
  }
  
  List<Animal> autocomplete(String text){
    List<Animal> animales = [];
    List<String> entorno = ['tierra', 'agua', 'aire'];
    List<String> reino = ['ave', 'pez', 'mamifero', 'anfibio', 'reptil'];
    List<String> alimentacion = ['herviboro', 'carnivoro', 'omnivoro'];
    List<String> reproduccion = ['viviparo', 'oviparo', 'ovoviviparo'];

    String inputText = removeDiacritics(text.toLowerCase());

    if(entorno.contains(inputText))
      animales.addAll(animalDataBase.animals.where((Animal animal) => animal.entorno.map((entorno) => removeDiacritics(entorno.toLowerCase())).toList().contains(inputText)));

    if(reino.contains(inputText))
      animales.addAll(animalDataBase.animals.where((Animal animal) => animal.reino.map((reino) => removeDiacritics(reino.toLowerCase())).toList().contains(inputText)));

    if(alimentacion.contains(inputText))
      animales.addAll(animalDataBase.animals.where((Animal animal) => animal.alimentacion.map((alimentacion) => removeDiacritics(alimentacion.toLowerCase())).toList().contains(inputText)));

    if(reproduccion.contains(inputText))
      animales.addAll(animalDataBase.animals.where((Animal animal) => animal.reproduccion.map((reproduccion) => removeDiacritics(reproduccion.toLowerCase())).toList().contains(inputText)));

    animales.addAll(animalDataBase.animals.where((Animal animal) => removeDiacritics(animal.name.toLowerCase()).contains(inputText)));
    return animales;
  }
}

class AnswerList extends StatefulWidget{
  AnswerList({super.key, required this.function, required this.animal});

  final Animal animal;
  final VoidCallback function;

  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList>{
  late List<Animal> answers = [];
  late Animal animal = widget.animal;

  @override
  Widget build(BuildContext context) {
    return Flexible(child: ListView.builder(
      reverse: true,
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

class EndGame extends StatelessWidget {
  EndGame({super.key, required this.animal, required this.tries, required this.victoria});
  final Animal animal;
  final int tries;
  final bool victoria;
  late String text = getText();

  String getText(){
    if(victoria) return '¡Has acertado el animal!\n';
    else return '¡Has perdido! El animal era ${animal.name}';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      content: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/dialogbox.png'),
            fit: BoxFit.cover,),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Text('$text¿Qué desea hacer?', style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        highlightColor: Color.fromARGB(0, 255, 255, 255),
                        child: const Image(image: AssetImage('assets/volver_menu.png'),
                          height: 90,
                          width: 90,),
                        onPressed: () {
                          GameDatabase.instance.create(Game(tries: tries, animal: animal.name));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      ),
                      Text(' Volver\nal Menú', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        highlightColor: Color.fromARGB(0, 255, 255, 255),
                        child: const Image(image: AssetImage('assets/back_button.png'),
                          height: 90,
                          width: 90,),
                        onPressed: () {
                          GameDatabase.instance.create(Game(tries: tries, animal: animal.name));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/GameScreen');
                        }
                      ),
                      Text('  Jugar\nOtra Vez', style: TextStyle(color: Colors.white, fontSize: 20),),
                    ],
                  )
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}