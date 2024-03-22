import 'package:flutter/material.dart';
import 'package:toyproject/homescreen.dart';


void main(){
  runApp(App());
}

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: homeScreen(),
    );
  }
}
