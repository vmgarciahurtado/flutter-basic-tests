import 'package:flutter/material.dart';
import 'package:flutter_tests/calculator/presentation/view/calculator_screen.dart';
import 'package:flutter_tests/calculator_history/presentation/view/calculator_history_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
