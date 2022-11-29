import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Animal {
  late String name;
  late ImageProvider image;
  late List<String> reino;
  late List<String> reproduccion;
  late List<String> alimentacion;
  late List<String> entorno;
  late int tamanyo;


  Animal(this.name, this.image, this.reino, this.reproduccion, this.alimentacion, this.entorno, this.tamanyo);

  String ToString(List<String> list){
    var buffer = new StringBuffer();

    list.forEach((String word) {buffer.write("$word\n");});
    return buffer.toString();
  }
}