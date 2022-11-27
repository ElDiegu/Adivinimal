import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Animal {
  late String name;
  late ImageProvider image;
  late List<String> c1;
  late List<String> c2;
  late List<String> c3;
  late int c4;
  late List<String> c5;

  Animal(this.name, this.image, this.c1, this.c2, this.c3, this.c4, this.c5);

  String ToString(List<String> list){
    var buffer = new StringBuffer();

    list.forEach((String word) {buffer.write("$word\n");});
    return buffer.toString();
  }
}