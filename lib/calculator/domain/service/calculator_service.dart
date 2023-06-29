import 'package:flutter_tests/calculator/domain/interface/i_calculator_repository.dart';
import 'package:flutter_tests/calculator/domain/model/operation.dart';

class CalculatorService {
  CalculatorService({required this.iCalculatorRepository});
  ICalculatorRepository iCalculatorRepository;

  Future<bool> saveOperation(Operation operation) async {
    return await iCalculatorRepository.saveOperation(operation);
  }

  Future<List<Operation>> getOperations() async {
    return await iCalculatorRepository.getOperations();
  }
}
