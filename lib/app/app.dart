import 'package:calculator/app/utils/colors.dart';
import 'package:calculator/app/view/calculator_page/calculator_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: textColor,
            displayColor: textColor
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}