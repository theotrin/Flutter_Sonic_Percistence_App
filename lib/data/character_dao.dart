import 'package:sonic_persistence_app/components/character.dart';
import 'package:sonic_persistence_app/data/database.dart';
import 'package:sqflite/sqflite.dart';

class CharacterDao{
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_type INTEGER,'
      '$_image TEXT)';

  static const String _tablename = 'sonicTable';
  static const String _name = 'name';
  static const String _type = 'type';
  static const String _image = 'image';

  save(Character character) async {
    print('Iniciando save...');
    final Database bancoDeDados = await getDatabase();

    var itemExists = await find(character.name);
    Map<String, dynamic> taskMap = toMap(character);
    if (itemExists.isEmpty) {
      print('A taréfa não existia');
      return await bancoDeDados.insert(
        _tablename,
        taskMap,
      );
    } else {
      print('A tarefa já existe...');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [character.name],
      );
    }
  }

  Map<String, dynamic> toMap(Character character) {
    print('Convertendo tarefa em map');

    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = character.name;
    mapaDeTarefas[_type] = character.type;
    mapaDeTarefas[_image] = character.imgUrl;

    print('Nosso mapa de tarefas: $mapaDeTarefas');

    return mapaDeTarefas;
  }

  Future<List<Character>> findAll() async {
    print('Acessando o findAll: ');

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... Econtrado: $result');

    return toList(result);
  }

  List<Character> toList(List<Map<String, dynamic>> charactersMap) {
    print('Convertendo lista de personagens...');
    final List<Character> characters = [];

    for (Map<String, dynamic> linha in charactersMap) {
      final Character character = Character(linha[_name], linha[_image], linha[_type]);
      characters.add(character);
    }

    print('Lista de tarefas: $characters');
    return characters;
  }

  Future<List<Character>> find(String characterName) async {
    print('Acessando find...');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [characterName],
    );

    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deletando tarefa...');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }
}