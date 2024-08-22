import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier {
  String _display = '0';
  double _result = 0;
  int _finalResult = 0;
  late String _operation;

  String get display => _display;

  void inputDigit(String digit) {
    if (_display == '0') {
      _display = digit;
    } else {
      _display += digit;
    }
    notifyListeners();
  }

  void inputDot() {
    if (!_display.contains('.')) {
      _display += '.';
    }
    notifyListeners();
  }

  void backspace() {
    if (_display.length > 1) {
      _display = _display.substring(0, _display.length - 1);
    } else {
      _display = '0';
    }
    notifyListeners();
  }

  void setOperation(String operation) {
    _operation = operation;
    _result = double.parse(_display);
    _display = '0';
  }


  void calculate() {
    double currentValue = double.parse(_display);

    switch (_operation) {
      case '+':
        _result += currentValue;
        break;
      case '-':
        _result -= currentValue;
        break;
      case '*':
        _result *= currentValue;
        break;
      case '/':
        _result /= currentValue;
        break;
    }

    if (_result % 1 == 0) {
      _finalResult = _result.toInt();
      _display = _finalResult.toString();
    } else {
      _display = _result.toString();
    }
    notifyListeners();
  }

  void clear() {
    _display = '0';
    _result = 0;
    _operation = '';
    notifyListeners();
  }
}
