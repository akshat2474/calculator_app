import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background(this.widget, {super.key});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Center(child: widget),
    );
  }
}
