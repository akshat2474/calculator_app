import 'package:flutter/material.dart';
import 'screens/vertical.dart';
import 'screens/horizontal.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SwitchScreenState();
  }
}

class _SwitchScreenState extends State<SwitchScreen> {
  var view = "vertical";  
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (!isPortrait) {
      setState(() {
        view = "horizontal";
      });
    } else {
      setState(() {
        view = "vertical";
      });
    }
    if (view == "vertical") {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: VerticalScreen(),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: HorizontalScreen(),
        ),
      );
    }
  }
}
