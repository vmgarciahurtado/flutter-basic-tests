import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/domain/service/calculator_service.dart';
import 'package:flutter_tests/calculator/infrastructure/calculator_repository_sqlite.dart';
import 'package:flutter_tests/calculator/presentation/history_screen/view/history_item.dart';
import 'package:flutter_tests/calculator/presentation/history_screen/view_model/history_vm.dart';
import 'package:get/get.dart';

class CalculatorHistoryScreen extends StatelessWidget {
  CalculatorHistoryScreen({super.key});

  final viewModel = CalculatorHistoryViewModel(
      calculatorService: CalculatorService(
          iCalculatorRepository: CalculatorRepositorySqlite()));
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(children: [
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(CupertinoIcons.arrow_left)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'calculator',
                      style: TextStyle(fontSize: 13),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => ListView.builder(
                        shrinkWrap: false,
                        itemCount: viewModel.operationList.length,
                        itemBuilder: (BuildContext context, int position) {
                          return HistoryItem(
                              operation: viewModel.operationList[position]);
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
