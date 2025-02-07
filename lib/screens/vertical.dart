import 'package:flutter/material.dart';
import 'package:calculator_app/background.dart';
import 'package:calculator_app/rows_buttons/row_button.dart';

class VerticalScreen extends StatefulWidget {
  const VerticalScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VerticalScreen();
  }
}

class _VerticalScreen extends State<VerticalScreen> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
        _currentInput = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else if (buttonText == "±") {
        if (_currentInput.isNotEmpty) {
          _currentInput = (-double.parse(_currentInput)).toString();
          _output = _currentInput;
        }
      } else if (buttonText == "%") {
        if (_currentInput.isNotEmpty) {
          _currentInput = (double.parse(_currentInput) / 100).toString();
          _output = _currentInput;
        }
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "÷") {
        _num1 = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "";
      } else if (buttonText == "=") {
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
            _output = (_num1 / _num2).toString();
            break;
        }
        _currentInput = _output;
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else {
        if (_currentInput == "0") {
          _currentInput = buttonText;
        } else {
          _currentInput += buttonText;
        }
        _output = _currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: BoxDecoration(color: Colors.black),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _output,
                style: TextStyle(color: Colors.white, fontSize: 48),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        RowButton(Color(0xFFFF9500), Color(0xFF505050), "AC", "±", "%", "÷", onPressed: _onButtonPressed),
        SizedBox(
          height: 12,
        ),
        RowButton(Color(0xFFFF9500), Color(0xFF2C2C2C), "7", "8", "9", "x", onPressed: _onButtonPressed),
        SizedBox(
          height: 12,
        ),
        RowButton(Color(0xFFFF9500), Color(0xFF2C2C2C), "4", "5", "6", "-", onPressed: _onButtonPressed),
        SizedBox(
          height: 12,
        ),
        RowButton(Color(0xFFFF9500), Color(0xFF2C2C2C), "1", "2", "3", "+", onPressed: _onButtonPressed),
        SizedBox(
          height: 12,
        ),
        BottomRowButton(Color(0xFFFF9500), Color(0xFF2C2C2C), "0", ".", "=", onPressed: _onButtonPressed),
      ],
    ));
  }
}