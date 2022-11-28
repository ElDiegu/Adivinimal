import 'package:adivinimal/widgets/MainMenu.dart';
import 'package:adivinimal/widgets/Settings.dart';
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
        '/MainMenu': (context) => MainMenu(),
        '/GameScreen': (context) => GameScreen(),
        '/Settings': (context) => Settings(),
      },
      initialRoute: '/MainMenu',
    );
  }
}