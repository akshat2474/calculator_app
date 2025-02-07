import 'package:flutter/material.dart';
import 'package:calculator_app/background.dart';
import 'package:calculator_app/rows_buttons/horizontal_row_button.dart';
import 'dart:math';

class HorizontalScreen extends StatefulWidget {
  const HorizontalScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HorizontalScreen();
  }
}

class _HorizontalScreen extends State<HorizontalScreen> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      try {
        if (buttonText == "AC") {
          _output = "0";
          _currentInput = "";
          _num1 = 0;
          _num2 = 0;
          _operator = "";
        } else if (buttonText == "±" && _currentInput.isNotEmpty) {
          _currentInput = (-double.parse(_currentInput)).toString();
          _output = _currentInput;
        } else if (buttonText == "%" && _currentInput.isNotEmpty) {
          _currentInput = (double.parse(_currentInput) / 100).toString();
          _output = _currentInput;
        } else if (["+", "-", "x", "÷", "xʸ", "ʸ√x"].contains(buttonText)) {
          if (_currentInput.isNotEmpty) {
            _num1 = double.parse(_currentInput);
            _operator = buttonText;
            _currentInput = "";
          }
        } else if (buttonText == "=" && _currentInput.isNotEmpty) {
          _num2 = double.parse(_currentInput);
          switch (_operator) {
            case "+":
              _output = (_num1 + _num2).toString();
              break;
            case "-":
              _output = (_num1 - _num2).toString();
              break;
            case "x":
              _output = (_num1 * _num2).toString();
              break;
            case "÷":
              _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
              break;
            case "xʸ":
              var result = pow(_num1, _num2);
              _output = result.isNaN || result.isInfinite ? "Error" : result.toString();
              break;
            case "ʸ√x":
              var result = pow(_num2, 1 / _num1);
              _output = result.isNaN || result.isInfinite ? "Error" : result.toString();
              break;
          }
          _currentInput = _output;
          _num1 = 0;
          _num2 = 0;
          _operator = "";
        } else if (buttonText == "x²" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = (val * val).toString();
          _currentInput = _output;
        } else if (buttonText == "x³" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = (val * val * val).toString();
          _currentInput = _output;
        } else if (buttonText == "²√x" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = val >= 0 ? sqrt(val).toString() : "Error";
          _currentInput = _output;
        } else if (buttonText == "³√x" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = pow(val, 1 / 3).toString();
          _currentInput = _output;
        } else if (buttonText == "ln" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = val > 0 ? log(val).toString() : "Error";
          _currentInput = _output;
        } else if (buttonText == "log₁₀" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = val > 0 ? (log(val) / ln10).toString() : "Error";
          _currentInput = _output;
        } else if (buttonText == "sin" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput) * (pi / 180);
          _output = sin(val).toString();
          _currentInput = _output;
        } else if (buttonText == "cos" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput) * (pi / 180);
          _output = cos(val).toString();
          _currentInput = _output;
        } else if (buttonText == "tan" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput) * (pi / 180);
          _output = tan(val).toString();
          _currentInput = _output;
        } else if (buttonText == "eˣ" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = exp(val).toString();
          _currentInput = _output;
        } else if (buttonText == "10ˣ" && _currentInput.isNotEmpty) {
          double val = double.parse(_currentInput);
          _output = pow(10, val).toString();
          _currentInput = _output;
        } else if (buttonText == "π") {
          _currentInput = pi.toString();
          _output = _currentInput;
        } else if (buttonText == "e") {
          _currentInput = exp(1).toString();
          _output = _currentInput;
        } else if (buttonText == "Rand") {
          _currentInput = Random().nextDouble().toString();
          _output = _currentInput;
        } else if (buttonText == "EE") {
          if (!_currentInput.contains('e')) {
            _currentInput += 'e';
            _output = _currentInput;
          }
        } else {
          if (buttonText == ".") {
            if (!_currentInput.contains(".")) {
              _currentInput = _currentInput.isEmpty ? "0." : "$_currentInput.";
            }
          } else {
            _currentInput = _currentInput == "0" ? buttonText : _currentInput + buttonText;
          }
          _output = _currentInput;
        }
      } catch (e) {
        _output = "Error";
        _currentInput = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _output,
                  style: const TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            ),
          ),
          HorizontalRows(
            Colors.black,
            const Color(0xFFFF9500),
            Colors.grey,
            const Color(0xFF2C2C2C),
            ")",
            "mc",
            "m+",
            "m-",
            "mr",
            "AC",
            "±",
            "%",
            "÷",
            onPressed: _onButtonPressed,
          ),
          const SizedBox(height: 6),
          HorizontalRows(
            Colors.white,
            const Color(0xFFFF9500),
            const Color(0xFF505050),
            const Color(0xFF2C2C2C),
            "x²",
            "x³",
            "xʸ",
            "eˣ",
            "10ˣ",
            "7",
            "8",
            "9",
            "x",
            onPressed: _onButtonPressed,
          ),
          const SizedBox(height: 6),
          HorizontalRows(
            Colors.white,
            const Color(0xFFFF9500),
            const Color(0xFF505050),
            const Color(0xFF2C2C2C),
            "²√x",
            "³√x",
            "ʸ√x",
            "ln",
            "log₁₀",
            "4",
            "5",
            "6",
            "-",
            onPressed: _onButtonPressed,
          ),
          const SizedBox(height: 6),
          HorizontalRows(
            Colors.white,
            const Color(0xFFFF9500),
            const Color(0xFF505050),
            const Color(0xFF2C2C2C),
            "sin",
            "cos",
            "tan",
            "e",
            "EE",
            "1",
            "2",
            "3",
            "+",
            onPressed: _onButtonPressed,
          ),
          const SizedBox(height: 6),
          HorizontalRows(
            Colors.white,
            const Color(0xFFFF9500),
            const Color(0xFF505050),
            const Color(0xFF2C2C2C),
            "sinh",
            "cosh",
            "tanh",
            "π",
            "Rand",
            "0",
            "0",
            ".",
            "=",
            onPressed: _onButtonPressed,
          ),
        ],
      ),
    );
  }
}