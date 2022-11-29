import 'package:adivinimal/widgets/MainMenu.dart';
import 'package:adivinimal/widgets/Settings.dart';
import 'package:adivinimal/widgets/GameHistory.dart';
import 'package:flutter/material.dart';
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
        '/GameHistory': (context) => GameHistory(),
      },
      initialRoute: '/MainMenu',
    );
  }
}