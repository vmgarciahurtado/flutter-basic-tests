import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorViewModel extends GetxController {
  TextEditingController textController = TextEditingController();

  double firsNumber = -1;
  double secondNumber = -1;

  bool isOperatorSelected = false;
  String operator = '';

  void addNumber(int number) {
    if (textController.text.contains('=')) {
      clearField();
    }

    textController.text += "$number";
    if (!isOperatorSelected) {
      firsNumber = double.parse(textController.text);
    } else {
      secondNumber = double.parse(textController.text);
    }
  }

  void addOperator(String operator) {
    textController.text = '';
    this.operator = operator;
    isOperatorSelected = true;
  }

  void clearField() {
    textController.text = '';
    firsNumber = -1;
    secondNumber = -1;
    isOperatorSelected = false;
    operator = '';
  }

  void result() {
    double a = firsNumber;
    double b = secondNumber;
    switch (operator) {
      case "+":
        textController.text = '${stringResult(a, b, operator)} ' '${add(a, b)}';
        break;
      case "-":
        textController.text =
            '${stringResult(a, b, operator)} ' '${substract(a, b)}';
        break;
      case "*":
        textController.text =
            '${stringResult(a, b, operator)} ' '${multiply(a, b)}';
        break;
      case "/":
        textController.text =
            '${stringResult(a, b, operator)} ' '${divide(a, b)}';
        break;
      default:
    }
  }

  String stringResult(double firstNumber, secondNumber, String operator) {
    return '$firsNumber'
        ' $operator'
        ' $secondNumber'
        ' =';
  }

  double add(double firstNumber, double secondNumber) {
    return firstNumber + secondNumber;
  }

  double substract(double firstNumber, double secondNumber) {
    return firstNumber - secondNumber;
  }

  double multiply(double firstNumber, double secondNumber) {
    return firstNumber * secondNumber;
  }

  double divide(double firstNumber, double secondNumber) {
    return firstNumber / secondNumber;
  }
}
