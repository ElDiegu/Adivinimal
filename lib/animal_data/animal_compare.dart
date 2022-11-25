import 'package:flutter/cupertino.dart';
import 'animal.dart';

class AnimalCompareWidget extends StatelessWidget{

  final Animal animal;

  const AnimalCompareWidget({super.key, required this.animal});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          /* First Row */
          Row( children: [
            Column( children: [
              Text(animal.name),
              Image(image: animal.image),
            ],)

          ],)
        ],
      )
    );
  }

}