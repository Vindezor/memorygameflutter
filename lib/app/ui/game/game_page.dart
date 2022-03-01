import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:memorygame/app/ui/game/widgets/game_app_bar.dart';
import 'package:memorygame/app/ui/game/widgets/game_body.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({ Key? key }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameController>(
      create: (_) {
        final controller = GameController();
        controller.startCountDown();
        return controller;
      },
      child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GameAppBar(),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: const GameBody()
      ),
    ),
    );
  }
}