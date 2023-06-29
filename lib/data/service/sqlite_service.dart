import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_tests/data/interface/i_sqlite_repository.dart';

class SqliteService extends ISqliteRepository {
  @override
  Future<dynamic> openDB() async {
    String dbName = 'database.db';
    Directory dir = await getApplicationDocumentsDirectory();
    String dirStringPath = dir.path;

    String dbPath = join(dirStringPath, dbName);

    bool existDb = await File(dbPath).exists();

    if (!existDb) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(join(dirStringPath, dbName)).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(dbPath);
  }

  @override
  Future closeDB(Database db) async {
    await db.close();
  }
}
