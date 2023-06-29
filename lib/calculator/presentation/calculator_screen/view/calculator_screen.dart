import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/domain/service/calculator_service.dart';
import 'package:flutter_tests/calculator/infrastructure/calculator_repository_sqlite.dart';
import 'package:flutter_tests/calculator/presentation/calculator_screen/view_model/calculator_vm.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final viewModel = CalculatorViewModel(
      calculatorService: CalculatorService(
          iCalculatorRepository: CalculatorRepositorySqlite()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        key: const Key('floating_button'),
        onPressed: () {
          Navigator.of(context).pushNamed('history');
        },
        child: const Icon(
          Icons.history,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 90),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: Colors.white,
                color: Colors.grey.shade300,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    textField(),
                    const SizedBox(height: 30),
                    content()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: TextField(
        key: const Key('main_text_field'),
        textAlign: TextAlign.center,
        maxLines: 2,
        enabled: true,
        controller: viewModel.textController,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: Get.textScaleFactor * 28,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        ),
      ),
    );
  }

  Widget content() {
    return Row(
      children: [
        Expanded(
            flex: 8,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 1; i < 10; i++) createNumberButton(i),
                createNumberButton(0),
                createClearButton(1),
                createClearButton(2),
              ],
            )),
        Expanded(
            flex: 2,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                createOperatorButton("+"),
                createOperatorButton("-"),
                createOperatorButton("*"),
                createOperatorButton("/"),
              ],
            )),
      ],
    );
  }

  Widget createNumberButton(int number) {
    return RawMaterialButton(
      onPressed: () {
        viewModel.addNumber(number);
      },
      key: Key('$number'),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Text(
        "$number",
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget createClearButton(int number) {
    String key = number == 1 ? "C" : "=";
    return RawMaterialButton(
      onPressed: () {
        number == 1 ? viewModel.clearField() : viewModel.result();
      },
      key: Key(key),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Text(
        number == 1 ? "C" : "=",
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget createOperatorButton(String symbol) {
    return RawMaterialButton(
      onPressed: () {
        viewModel.addOperator(symbol);
      },
      key: Key(symbol),
      elevation: 2.0,
      fillColor: Colors.orange.shade300,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: Text(
        symbol,
        style: const TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
