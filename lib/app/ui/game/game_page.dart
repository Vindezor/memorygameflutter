import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:memorygame/app/ui/game/widgets/game_app_bar/game_app_bar.dart';
import 'package:memorygame/app/ui/game/widgets/game_body/game_body.dart';
import 'package:memorygame/app/ui/game/widgets/memory_box/memory_box_controller.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({ Key? key }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameController>(
          create: (_) {
            final controller = GameController(context);
            controller.startCountDown();
            return controller;
          },
        ),
        ChangeNotifierProvider<MemoryBoxController>(
          create: (_) {
            final controller = MemoryBoxController();
            controller.setItems();
            return controller;
          }
        )
      ],
  
      child: WillPopScope(
        onWillPop: () async {
          return false;
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
      ),
    );
  }
}