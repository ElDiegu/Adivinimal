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
          children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: MaterialButton(
                    child: const Image(image: AssetImage('assets/close_button.png'),
                      height: 90,
                      width: 90,),
                    onPressed: () {

                    }
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    child: const Image(image: AssetImage('assets/config.png'),
                      height: 90,
                      width: 90,),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Settings');
                    }
                  ),
                ),
              ]
            ),
            Center(
              child: MaterialButton(
                child: const Image(image: AssetImage('assets/play_button.png')),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Game');
                }
              ),
            ),
          ]
        )
      )
    );
  }
}