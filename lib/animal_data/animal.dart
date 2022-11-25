import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Animal {
  late String name;
  late ImageProvider image;
  late List<String> c1;
  late List<String> c2;
  late List<String> c3;
  late List<String> c4;
  late List<String> c5;

  anima(String name, ImageProvider image, List<String> c1, List<String> c2, List<String> c3, List<String> c4, List<String> c5, ){
    this.name = name;
    this.image = image;
    this.c1 = c1;
    this.c2 = c2;
    this.c3 = c3;
    this.c4 = c4;
    this.c5 = c5;
  }
}