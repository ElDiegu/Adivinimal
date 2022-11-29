import 'dart:io';
import 'package:adivinimal/widgets/GameHistory.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget{
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/menu_principal_fondo.png'),
            fit: BoxFit.cover,)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  highlightColor: Color.fromARGB(0, 255, 255, 255),
                  child: const Image(image: AssetImage('assets/close.png'),
                    height: 100,
                    width: 100,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color.fromARGB(0, 0, 0, 0),
                        content: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/close_menu.png'),
                              fit: BoxFit.cover,),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                                child: MaterialButton(
                                  highlightColor: Color.fromARGB(0, 255, 255, 255),
                                  child: const Image(image: AssetImage('assets/close_yes.png'),
                                    height: 90,
                                    width: 90,),
                                  onPressed: () {
                                    exit(0);
                                  }
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                                child: MaterialButton(
                                  highlightColor: Color.fromARGB(0, 255, 255, 255),
                                  child: const Image(image: AssetImage('assets/close_no.png'),
                                    height: 90,
                                    width: 90,),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
                MaterialButton(
                    highlightColor: Color.fromARGB(0, 255, 255, 255),
                    child: const Image(image: AssetImage('assets/config.png'),
                      height: 100,
                      width: 100,),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Settings');
                    }
                  ),
              ]
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
              child: Image(image: AssetImage('assets/adivinimal.png')),
            ),
            MaterialButton(
              highlightColor: Color.fromARGB(0, 255, 255, 255),
              child: const Image(image: AssetImage('assets/play_button.png')),
              onPressed: () {
                Navigator.of(context).pushNamed('/GameScreen');
              }
            ),
            MaterialButton(
              child: const Text('Historial'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GameHistory())),
            )
          ]
        )
      )
    );
  }
}