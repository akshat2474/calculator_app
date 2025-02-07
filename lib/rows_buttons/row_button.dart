import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(this.color, this.symbol, {super.key, required this.onPressed});
  final Color color;
  final String symbol;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(5),
            backgroundColor: color,
            foregroundColor: Colors.white,
            fixedSize: const Size(75, 75)),
        onPressed: () {
          onPressed(symbol);
        },
        child: Text(
          symbol,
          style: TextStyle(fontFamily: 'SFPro', fontSize: 28),
        ));
  }
}

class RowButton extends StatelessWidget {
  const RowButton(this.colorButton2, this.colorButton, this.s1, this.s2, this.s3, this.s4,
      {super.key, required this.onPressed});
  final String s1;
  final String s2;
  final String s3;
  final String s4;
  final Color colorButton;
  final Color colorButton2;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25,
        ),
        Button(colorButton, s1, onPressed: onPressed),
        SizedBox(
          width: 15,
        ),
        Button(colorButton, s2, onPressed: onPressed),
        SizedBox(
          width: 15,
        ),
        Button(colorButton, s3, onPressed: onPressed),
        SizedBox(
          width: 15,
        ),
        Button(colorButton2, s4, onPressed: onPressed),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }
}

class BottomRowButton extends StatelessWidget {
  const BottomRowButton(this.colorButton2, this.colorButton, this.s1, this.s2, this.s3,
      {super.key, required this.onPressed});
  final String s1;
  final String s2;
  final String s3;
  final Color colorButton;
  final Color colorButton2;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 25,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.all(5),
                backgroundColor: colorButton,
                foregroundColor: Colors.white,
                fixedSize: const Size(164, 75)),
            onPressed: () {
              onPressed(s1);
            },
            child: Text(
              s1,
              style: TextStyle(fontFamily: 'SFPro', fontSize: 30),
            )),
        SizedBox(
          width: 15,
        ),
        Button(colorButton, s2, onPressed: onPressed),
        SizedBox(
          width: 15,
        ),
        Button(colorButton2, s3, onPressed: onPressed),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }
}