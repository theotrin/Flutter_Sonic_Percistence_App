import 'package:path/path.dart';
import 'package:sonic_persistence_app/data/character_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'sonic.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CharacterDao.tableSql);
    },
    version: 1,
  );
}
