import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({ Key? key }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Game"),),
    );
  }
}