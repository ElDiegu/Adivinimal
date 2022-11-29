import 'package:flutter/cupertino.dart';
import 'animal.dart';
import 'package:collection/collection.dart';

class AnimalCompareWidget extends StatelessWidget{

  final Animal originalAnimal;
  final Animal animalChosen;

  AnimalCompareWidget({super.key,required this.originalAnimal, required this.animalChosen}){
    Compare(originalAnimal.reino,animalChosen.reino, 0);
    Compare(originalAnimal.reproduccion,animalChosen.reproduccion, 1);
    Compare(originalAnimal.alimentacion,animalChosen.alimentacion, 2);
    Compare(originalAnimal.entorno,animalChosen.entorno, 3);
    CompareSize(originalAnimal.tamanyo, animalChosen.tamanyo, 4);
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
            Text(animalChosen.name, textAlign: TextAlign.center,),
            Image(image: animalChosen.image),
            /*Cuarta categoría*/
            Text("Alimentación"),
            Stack(children: [
              Image(image: images[2]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.alimentacion), textAlign: TextAlign.center, textScaleFactor: 1.2,)))
            ],),
          ],)),
          Expanded(child: Column( children: <Widget>[
            Text("Reino"),
            Stack(children: [
              Image(image: images[0]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.reino), textAlign: TextAlign.center, textScaleFactor: 1.2,)))
            ],),
            Text("Entorno"),
            Stack(children: [
              Image(image: images[3]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.entorno), textAlign: TextAlign.center, textScaleFactor: 1.2,)))
            ],),
          ],)),
          Expanded(child: Column( children: <Widget>[
            Text("Reproducción"),
            Stack(children: [
              Image(image: images[1]),
              Positioned.fill(child: Center(child: Text(animalChosen.ToString(animalChosen.reproduccion), textAlign: TextAlign.center, textScaleFactor: 1.2,)))
            ],),
            Text("Tamaño"),
            Stack(children: [
              Image(image: images[4]),
              Positioned.fill(bottom: 20, child: Center(child: Text('${animalChosen.tamanyo}cm', textAlign: TextAlign.center, textScaleFactor: 1.2,)))
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

class _AnimalCompareWidget extends StatefulWidget{

  final Animal originalAnimal;
  final Animal animalChosen;

  _AnimalCompareWidget({super.key, required this.originalAnimal, required this.animalChosen});

  @override
  State<StatefulWidget> createState() => AnimalCompareWidgetState(originalAnimal: originalAnimal, animalChosen: animalChosen);
}

class AnimalCompareWidgetState extends State<_AnimalCompareWidget>{

  final Animal originalAnimal;
  final Animal animalChosen;

  AnimalCompareWidgetState({required this.originalAnimal, required this.animalChosen});

  @override
  Widget build(BuildContext context){
    return AnimalCompareWidget(originalAnimal: originalAnimal, animalChosen: animalChosen,).build(context);
  }
}