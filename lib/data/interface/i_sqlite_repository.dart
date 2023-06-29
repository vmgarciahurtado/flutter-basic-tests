import 'package:sqflite/sqflite.dart';

abstract class ISqliteRepository {
  Future<dynamic> openDB();
  Future<dynamic> closeDB(Database db);
}
