import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Image(image: AssetImage('assets/boton.png')),
          onPressed: () {
            Navigator.of(context).pushNamed();
          }
        )
      )
    );
  }
}