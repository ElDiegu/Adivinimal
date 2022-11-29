import 'package:adivinimal/data/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GameHistory extends StatelessWidget{
  late List<Game> games;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: games.length,
              itemBuilder: (context, index) => GameWidget(game: games[index]),
          )
        ),
      ),
    );
  }

  Future getGames() async{
    this.games = await GameDatabase.instance.readAll();
  }

}

class GameWidget extends StatelessWidget{

  final Game game;
  const GameWidget({super.key, required this.game});
  
  @override
  Widget build(BuildContext context){
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Text('Partida ${game.id}'),
          Text('Intentos: ${game.tries}'),
          Text('Animal ${game.animal}')
        ],
      ),
    );
  }
}