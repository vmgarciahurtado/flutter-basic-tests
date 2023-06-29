import 'package:flutter_tests/calculator/domain/model/operation.dart';

abstract class ICalculatorRepository {
  Future<void> saveOperation(Operation operation);
  Future<List<Operation>> getOperations();
}
