import 'dart:developer';

import 'package:flutter_tests/calculator/domain/interface/i_calculator_repository.dart';
import 'package:flutter_tests/calculator/domain/model/operation.dart';
import 'package:flutter_tests/data/service/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class CalculatorRepositorySqlite extends ICalculatorRepository {
  @override
  Future<List<Operation>> getOperations() async {
    List<Operation> lisOperation = [];
    try {
      SqliteService _sqliteService = SqliteService();
      Database db = await _sqliteService.openDB();
      String statement =
          "SELECT id,operation,result FROM operations_history ORDER BY id DESC";
      List<Map<String, dynamic>> list = await db.rawQuery(statement);
      lisOperation =
          List<Operation>.from(list.map((x) => Operation.fromJson(x)));
    } catch (e) {
      log('Error al consultar las operaciones $e');
    }
    return lisOperation;
  }

  @override
  Future<void> saveOperation(Operation operation) async {
    try {
      SqliteService _sqliteService = SqliteService();
      Database db = await _sqliteService.openDB();
      await db.insert('operations_history', operation.toJson());
    } catch (e) {
      log('Error al registrar la  operacion $e');
    }
  }
}
