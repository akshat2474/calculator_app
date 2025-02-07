import 'package:flutter/material.dart';

List<String> values = [];

class HorizontalRowButton extends StatelessWidget {
  const HorizontalRowButton(this.color, this.symbol, this.color2, {super.key, required this.onPressed});
  final Color color;
  final Color color2;
  final String symbol;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.all(5),
            backgroundColor: color,
            foregroundColor: color2,
            fixedSize: const Size(80, 45)),
        onPressed: () {
          onPressed(symbol); // Call the onPressed callback
        },
        child: Text(
          symbol,
          style: TextStyle(fontFamily: 'SFPro', fontSize: 20),
        ));
  }
}

class HorizontalRows extends StatelessWidget {
  const HorizontalRows(
      this.textColor,
      this.colorButton3,
      this.colorButton2,
      this.colorButton,
      this.s1,
      this.s2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.s9,
      {super.key, required this.onPressed});
  final String s1;
  final String s2;
  final String s3;
  final String s4;
  final String s5;
  final String s6;
  final String s7;
  final String s8;
  final String s9;
  final Color colorButton;
  final Color colorButton2;
  final Color colorButton3;
  final Color textColor;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        HorizontalRowButton(colorButton, s1, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton, s2, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton, s3, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton, s4, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton, s5, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton2, s6, textColor, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton2, s7, textColor, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton2, s8, textColor, onPressed: onPressed),
        SizedBox(
          width: 11,
        ),
        HorizontalRowButton(colorButton3, s9, Colors.white, onPressed: onPressed),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}