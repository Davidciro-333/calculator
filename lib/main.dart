import 'package:calculator/app/app.dart';
import 'package:calculator/app/logic_operational/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CalculatorModel(),
          child: const MyApp()
      )
  );
}
