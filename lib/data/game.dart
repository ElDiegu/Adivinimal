import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:adivinimal/animal_data/animal.dart';
import 'package:collection/collection.dart';

class GameDatabase {
  //WidgetsFlutterBinding.ensureInitialized();

  static final GameDatabase instance = GameDatabase._init();

  static Database? _database;

  GameDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _initDB('games.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final triesType = 'INTEGER NOT NULL';
    final animalType = 'TEXT NOT NULL';

    await db.execute('CREATE TABLE ${gameList} (${GameFields.id} $idType, ${GameFields.tries} $triesType, ${GameFields.animal} $animalType)');
  }

  Future<Game> create(Game game) async{
    final db = await instance.database;
    final id = await db.insert(gameList, game.toMap());
    final map = game.toMap();
    print('${game.copy(id: id)} AÑADIDO');
    return game.copy(id: id);
  }

  Future<List<Game>> readAll() async{
    final db = await instance.database;
    final result = await db.query(gameList);
    return result.map((map) => Game.fromMap(map)).toList();
  }

  Future close() async{
    final db = await instance.database;
    db.delete('$gameList');
  }
}

final String gameList = 'games';

class GameFields{
  static final List<String> values = [id, tries, animal];

  static final String id = '_id';
  static final String tries = 'tries';
  static final String animal = 'animal';
}

class Game{
  final int? id;
  final int tries;
  final String animal;

  const Game({this.id, required this.tries, required this.animal});

  Game copy({int? id, int? tries, String? animal}) => Game(id: id ?? this.id, tries: tries ?? this.tries, animal: animal ?? this.animal);

  Map<String, Object?> toMap() => {
      GameFields.id : id,
      GameFields.tries : tries,
      GameFields.animal : animal
  };

  static Game fromMap(Map<String, Object?> map) => Game(id: map[GameFields.id] as int?, tries: map[GameFields.tries] as int, animal: map[GameFields.animal] as String);

  @override
  String toString(){
    return 'Game(id: $id, tries: $tries, animal: $animal)';
  }
}

