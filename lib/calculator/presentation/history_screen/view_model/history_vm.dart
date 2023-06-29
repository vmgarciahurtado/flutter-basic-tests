import 'package:flutter_tests/calculator/domain/model/operation.dart';
import 'package:flutter_tests/calculator/domain/service/calculator_service.dart';
import 'package:get/get.dart';

class CalculatorHistoryViewModel extends GetxController {
  CalculatorService calculatorService;
  RxList<Operation> operationList = RxList();
  CalculatorHistoryViewModel({required this.calculatorService}) {
    getOperationHistory();
  }

  Future<void> getOperationHistory() async {
    operationList.value = await calculatorService.getOperations();
  }
}
