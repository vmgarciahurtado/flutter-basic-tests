import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/domain/model/operation.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.operation});

  final Operation operation;

  @override
  Widget build(BuildContext context) {
    final color = operation.operation == 1
        ? Colors.red
        : operation.operation == 2
            ? Colors.blue
            : operation.operation == 3
                ? Colors.amber
                : Colors.green;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Text(operation.result),
        ),
      ),
    );
  }
}
