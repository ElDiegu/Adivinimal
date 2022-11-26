import 'package:adivinimal/widgets/Game.dart';
import 'package:adivinimal/widgets/MainMenu.dart';
import 'package:adivinimal/widgets/Settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/mainMenu': (context) => MainMenu(),
        '/Game': (context) => Game(),
        '/Settings': (context) => Settings(),
      },
      initialRoute: '/mainMenu',
    );
  }
}