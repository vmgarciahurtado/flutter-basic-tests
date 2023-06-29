import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/presentation/calculator_screen/view/calculator_screen.dart';
import 'package:flutter_tests/calculator/presentation/history_screen/view/calculator_history_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        'calculator': (_) => CalculatorScreen(),
        'history': (_) => CalculatorHistoryScreen()
      },
      initialRoute: 'calculator',
    );
  }
}
