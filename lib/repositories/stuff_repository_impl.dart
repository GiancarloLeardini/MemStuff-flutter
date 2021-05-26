import 'package:memstuff/core/app_const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/stuff_model.dart';
import 'stuff_repository.dart';

class StuffRepositoryImpl implements StuffRepository {
  static const kTableName = 'stuff';
  static const kCreateTableSql =
      'CREATE TABLE $kTableName(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, contactName TEXT, phone TEXT, date TEXT, photoPath TEXT);';

  Future<Database> _getDataBase() async {
    final path = join(await getDatabasesPath(), kDatabaseName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(kCreateTableSql);
      },
      version: kDatabaseVersion,
    );
  }

  @override
  Future create(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDataBase();
      await db.insert(
        kTableName,
        stuff.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (error) {
      print(error);
    } finally {
      db.close();
    }
  }

  @override
  Future delete(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDataBase();
      await db.delete(
        kTableName,
        where: 'id = ?',
        whereArgs: [stuff.id],
      );
    } catch (error) {
      print(error);
    } finally {
      db.close();
    }
  }

  @override
  Future update(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDataBase();
      await db.update(
        kTableName,
        stuff.toMap(),
        where: 'id = ?',
        whereArgs: [stuff.id],
      );
    } catch (error) {
      print(error);
    } finally {
      db.close();
    }
  }

  @override
  Future<List<StuffModel>> readAll() async {
    Database db;
    try {
      db = await _getDataBase();
      final data = await db.query(kTableName);
      return List.generate(
        data.length,
        (index) => StuffModel.fromMap(data[index]),
      );
    } catch (error) {
      print(error);
      return <StuffModel>[];
    } finally {
      db.close();
    }
  }

  @override
  Future<StuffModel> readById(int id) async {
    Database db;
    try {
      db = await _getDataBase();
      final data = await db.query(
        kTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return StuffModel.fromMap(data[0]);
    } catch (error) {
      print(error);
      return null;
    } finally {
      db.close();
    }
  }
}
