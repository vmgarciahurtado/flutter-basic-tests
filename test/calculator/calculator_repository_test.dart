import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/calculator/domain/model/operation.dart';
import 'package:flutter_tests/calculator/infrastructure/calculator_repository_sqlite.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'calculator_repository_test.mocks.dart';

@GenerateMocks([CalculatorRepositorySqlite, Operation])
void main() {
  final calculatorRepository = MockCalculatorRepositorySqlite();
  group('verify CalculatorRepository methods', () {
    test('getOperations', () async {
      MockOperation mockOperation = MockOperation();
      List<MockOperation> listMockOperation = [mockOperation];

      when(calculatorRepository.getOperations())
          .thenAnswer((_) => Future.value(listMockOperation));

      expect(await calculatorRepository.getOperations(), listMockOperation);
    });
    test('saveOperation', () async {
      MockOperation mockOperation = MockOperation();

      when(calculatorRepository.saveOperation(mockOperation))
          .thenAnswer((_) => Future.value(true));

      expect(await calculatorRepository.saveOperation(mockOperation), true);
    });
  });
}
