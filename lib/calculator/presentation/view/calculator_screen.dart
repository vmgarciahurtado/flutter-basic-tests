import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/presentation/view_model/calculator_vm.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final viewModel = Get.put(CalculatorViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        textAlign: TextAlign.center,
        maxLines: 2,
        enabled: false,
        controller: viewModel.textController,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: Get.textScaleFactor * 28,
        ),
        keyboardType: TextInputType.number,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: false,
          selectAll: true,
        ),
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
                createNumberButton(1),
                createNumberButton(2),
                createNumberButton(3),
                createNumberButton(4),
                createNumberButton(5),
                createNumberButton(6),
                createNumberButton(7),
                createNumberButton(8),
                createNumberButton(9),
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
    return RawMaterialButton(
      onPressed: () {
        number == 1 ? viewModel.clearField() : viewModel.result();
      },
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
