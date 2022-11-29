import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/fondo.png'),
              fit: BoxFit.cover,)
        ),
        child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 170),
                child: Text('OPCIONES', style: TextStyle(
                    color: Color.fromARGB(240, 255, 255, 255), fontSize: 35)),
              ),
              Text('Número máximo de intentos:', style: TextStyle(
                  color: Color.fromARGB(240, 0, 0, 0), fontSize: 25)),
              StateSettings(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: MaterialButton(
                  highlightColor: Color.fromARGB(0, 255, 255, 255),
                    child: Image(image: AssetImage('assets/back_button.png'),
                      width: 100, height: 100,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class StateSettings extends StatefulWidget{
  const StateSettings({super.key});

  @override
  State<StatefulWidget> createState() => SettingsWidget();
}

class SettingsWidget extends State<StateSettings>{
  static bool opcion5 = false;
  static bool opcion7 = true;
  static bool opcion10 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(value: opcion5,
                    activeColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState((){
                        opcion5 = true;
                        opcion7 = false;
                        opcion10 = false;
                      });
                    }
                ),
                Text('5', style: TextStyle(
                    color: Color.fromARGB(240, 0, 0, 0), fontSize: 25)),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(value: opcion7,
                    activeColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState(() {
                        opcion7 = true;
                        opcion5 = false;
                        opcion10 = false;
                      });
                    }
                ),
                Text('7', style: TextStyle(
                    color: Color.fromARGB(240, 0, 0, 0), fontSize: 25)),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(value: opcion10,
                    activeColor: Colors.blue,
                    onChanged: (bool? value) {
                      setState((){
                        opcion10 = true;
                        opcion5 = false;
                        opcion7 = false;
                      });
                    }
                ),
                Text('10', style: TextStyle(
                    color: Color.fromARGB(240, 0, 0, 0), fontSize: 25)),
              ]
          ),
        ],
      )
    );
  }
}