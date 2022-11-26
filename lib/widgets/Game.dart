import 'package:flutter/material.dart';

class Game extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: MaterialButton(
              child: Image(image: AssetImage('assets/back_button.png')),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
        )
    );
  }
}