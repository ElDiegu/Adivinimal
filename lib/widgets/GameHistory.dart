import 'package:adivinimal/data/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GameHistoryState extends State<GameHistory>{
  late List<Game> games = [];
  bool isLoading = false;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    getGames();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fondo.png'),
          fit: BoxFit.fill),
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Flexible(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: games.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => GameWidget(game: games[index]),
              )
          ),
          ElevatedButton(onPressed: closeDatabase, child: Text('Borrar historial')),
          MaterialButton(onPressed: () => Navigator.of(context).pop(), child: Image(width: 100, height: 100,image: AssetImage('assets/back_button.png')))
        ],)
      ),
    );
  }

  Future getGames() async{
    List<Game> _games = await GameDatabase.instance.readAll();
    setState(() => this.games = _games);
  }

  Future closeDatabase() async{
    GameDatabase.instance.close();
    getGames();
  }
}

class GameHistory extends StatefulWidget{
  GameHistory({super.key}){
    getGames();
  }

  late List<Game> games = [];

  Future getGames() async{
    print('${await GameDatabase.instance.readAll()}');
    this.games = await GameDatabase.instance.readAll();
    print('${games}');
  }

  @override
  GameHistoryState createState() => GameHistoryState();
}

class GameWidget extends StatelessWidget{

  final Game game;
  const GameWidget({super.key, required this.game});
  
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 191, 229, 240),
          border: Border.all(width: 2),
        ),
          child: Column(
            children: [
              Text('Partida ${game.id}'),
              Text('Intentos: ${game.tries}'),
              Text('Animal: ${game.animal}')
            ],)
      ),
    );
  }
}