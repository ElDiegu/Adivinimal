import 'package:flutter/cupertino.dart';
import 'animal.dart';
import 'package:collection/collection.dart';

class AnimalCompareWidget extends StatelessWidget{

  final Animal originalAnimal;
  final Animal animalChosen;

  AnimalCompareWidget({super.key,required this.originalAnimal, required this.animalChosen}){
    Compare(originalAnimal.c1,animalChosen.c1, 0);
    Compare(originalAnimal.c2,animalChosen.c2, 1);
    Compare(originalAnimal.c3,animalChosen.c3, 2);
    CompareSize(originalAnimal.c4, animalChosen.c4, 3);
    Compare(originalAnimal.c5,animalChosen.c5, 4);
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/caja.png'),
          fit: BoxFit.fill,
        )
      ),
      padding: const EdgeInsets.all(15),
      //width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          /* First Row */
          Expanded(child: Column( children: <Widget>[
            /*Nombre y foto*/
            Text(animalChosen.name),
            Image(image: AssetImage('assets/naranja.png')),
            /*Cuarta categoría*/
            Text("Entorno"),
            Stack(children: [
              Image(image: images[2]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.c3), textAlign: TextAlign.center, textScaleFactor: 1.5,)))
            ],),
          ],)),
          Expanded(child: Column( children: <Widget>[
            Text("Reino"),
            Stack(children: [
              Image(image: images[0]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.c2), textAlign: TextAlign.center, textScaleFactor: 1.5,)))
            ],),
            Text("Tamaño"),
            Stack(children: [
              Image(image: images[3]),
              Positioned.fill(bottom: 20,child: Center(child: Text('${animalChosen.c4}cm', textAlign: TextAlign.center, textScaleFactor: 1.5,)))
            ],),
          ],)),
          Expanded(child: Column( children: <Widget>[
            Text("Alimentación"),
            Stack(children: [
              Image(image: images[1]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.c3), textAlign: TextAlign.center, textScaleFactor: 1.5,)))
            ],),
            Text("Reproducción"),
            Stack(children: [
              Image(image: images[4]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.c5), textAlign: TextAlign.center, textScaleFactor: 1.5,)))
            ],),
          ],))
        ],
      )
    );
  }

  List<AssetImage> images = List.filled(5, AssetImage('assets/rojo.png'));

  void Compare(List<String> originalAnimal, List<String> chosenAnimal, int index){

    chosenAnimal.forEach((String word) {
      if(HasWord(originalAnimal, word)){
        images[index] = AssetImage('assets/naranja.png');
      }
    });

    Function equals = const DeepCollectionEquality.unordered().equals;
    if(equals(originalAnimal, chosenAnimal)) images[index] = AssetImage('assets/verde.png');
  }

  void CompareSize(int originalAnimal, int chosenAnimal, int index){
    if(chosenAnimal > (originalAnimal + 75) || chosenAnimal < (originalAnimal-75)) images[index] = AssetImage('assets/naranja.png');
    else if(chosenAnimal == originalAnimal) images[index] = AssetImage('assets/verde.png');
  }

  bool HasWord(List<String> comparingList, String comparingWord){
    if(comparingList.contains(comparingWord)) return true;
    return false;
  }
}