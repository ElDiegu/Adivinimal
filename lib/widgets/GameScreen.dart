import 'dart:async';
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
      floatingActionButton: MaterialButton(onPressed: Navigator.of(context).pop, child: Image(width: 100, image: AssetImage('assets/back_button.png'),),),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/fondo.png'), fit: BoxFit.fill)),
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Image(width: 200,image: AssetImage('assets/adivinimal_logo.png')),
            Text('Intentos: $tries/$maxTries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
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
            MaterialButton(
                onPressed: () {
                  if(selectedAnimal == null) return;
                  FocusManager.instance.primaryFocus?.unfocus();
                  _key.currentState!.addAnswer(selectedAnimal);
                  print('${animal.name}');
                  print('${selectedAnimal.name}');
                  if(selectedAnimal.name == animal.name){
                    print('VICTORIA');
                    showDialog(
                      context: context,
                      builder: (context) => EndGame(tries: tries, animal: animal, victoria: true, maxTries: maxTries,),
                    );
                    return;
                  }
                  if(tries == maxTries){
                    showDialog(
                      context: context,
                      builder: (context) => EndGame(tries: tries, animal: animal, victoria: false, maxTries: maxTries,),
                    );
                  }
                },
                child: Image(image: AssetImage('assets/confirmar.png'))
            ),
            AnswerList(key: _key,function: addTry, animal: animal,),

          ],
        ),
      ),
    );
  }

  addTry() => setState(() => tries++);

  int getTries(){
    if(SettingsWidget.opcion5) return 5;
    if(SettingsWidget.opcion7) return 7;
    if(SettingsWidget.opcion10) return 10;
    return 5;
  }
  
  List<Animal> autocomplete(String text){
    List<Animal> animales = [];
    List<String> entorno = ['tierra', 'agua', 'aire'];
    List<String> reino = ['ave', 'pez', 'mamifero', 'anfibio', 'reptil'];
    List<String> alimentacion = ['herbivoro', 'carnivoro', 'omnivoro'];
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

  final ScrollController _controller = new ScrollController();

  void _scrollDown(){
    Timer(Duration(milliseconds: 50), _scroll);
  }

  void _scroll(){
    _controller.jumpTo(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(child: ListView.separated(
      reverse: true,
      controller: _controller,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: answers.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => AnimalCompareWidget(
          originalAnimal: animal,
          animalChosen: answers[index]
      ),
    ));
  }

  addAnswer(Animal animal) {answers.add(animal); print('child method'); widget.function(); _scrollDown();}
}

class EndGame extends StatelessWidget {
  EndGame({super.key, required this.animal, required this.tries, required this.victoria, required this.maxTries});
  final Animal animal;
  final int tries;
  final int maxTries;
  final bool victoria;
  late String text = getText();
  late String resultado = victoria ? 'Victoria' : 'Derrota';

  String getText(){
    if(victoria) return '¡Has acertado el animal!\n';
    else return '¡Has perdido! El animal era ${animal.name}\n';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      content: Container(
        //height: 300,
        //width: 300,
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/dialogbox.png'),
            fit: BoxFit.cover,),
        ),
        child: Wrap(
          spacing: 50,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: Text('$text¿Qué desea hacer?', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        highlightColor: Color.fromARGB(0, 255, 255, 255),
                        child: const Image(image: AssetImage('assets/volver_menu.png'),
                          height: 90,
                          width: 90,),
                        onPressed: () {
                          GameDatabase.instance.create(Game(tries: '${tries}/${maxTries} - ${resultado}', animal: animal.name));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                      ),
                      Text('Volver\nal Menú', style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        highlightColor: Color.fromARGB(0, 255, 255, 255),
                        child: const Image(image: AssetImage('assets/back_button.png'),
                          height: 90,
                          width: 90,),
                        onPressed: () {
                          GameDatabase.instance.create(Game(tries: '${tries}/${maxTries} - ${resultado}', animal: animal.name));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/GameScreen');
                        }
                      ),
                      Text('  Jugar\nOtra Vez', style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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