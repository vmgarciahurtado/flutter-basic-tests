import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/calculator/presentation/view_model/calculator_vm.dart';
import 'package:get/get.dart';

main() {
  test('The calculator returns 8 when adding 6 and 2', () {
    //* 1st step: ARRANGE */
    final calculator = Get.put(CalculatorViewModel());

    //* 2st step: ACT */
    final result = calculator.add(6, 2);

    //* 2st step: ASSERT */
    //? In the event of a failure, we may provide additional information to the person who will arrange the test.,
    //? En caso de falla, podemos proporcionar información adicional a la persona que arreglará la prueba.
    expect(result, 8, reason: 'It should be exactly 8');
  });
  test('The calculator returns 4 when substract 8 and 4', () {
    final calculator = Get.put(CalculatorViewModel());
    final result = calculator.substract(8, 4);

    expect(result, 4, reason: 'It should be exactly 4');
  });
  test('The calculator returns 680 when multiply 17 and 40', () {
    final calculator = Get.put(CalculatorViewModel());
    final result = calculator.multiply(17, 40);

    expect(result, 680, reason: 'It should be exactly 680');
  });
  test('The calculator returns 20 when divide 100 and 5', () {
    final calculator = Get.put(CalculatorViewModel());
    final result = calculator.divide(100, 5);

    expect(result, 20, reason: 'It should be exactly 20');
  });
}
