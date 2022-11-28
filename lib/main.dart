import 'package:adivinimal/widgets/MainMenu.dart';
import 'package:flutter/material.dart';
import 'package:adivinimal/animal_data/animal_compare.dart';
import 'package:adivinimal/widgets/AnimalPruebas.dart';
import 'package:adivinimal/widgets/GameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/GameSceen': (context) => GameScreen(),
      },
      initialRoute: '/GameSceen',
    );
  }
}