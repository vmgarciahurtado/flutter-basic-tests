import 'package:flutter_tests/calculator/domain/model/operation.dart';

abstract class ICalculatorRepository {
  Future<bool> saveOperation(Operation operation);
  Future<List<Operation>> getOperations();
}
