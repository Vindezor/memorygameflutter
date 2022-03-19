import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:provider/provider.dart';

class GameBody extends StatelessWidget {
  const GameBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final controller = Provider.of<GameController>(context);
    return (controller.gameStarted)
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  controller.memoryItems[0],
                  controller.memoryItems[1],
                  controller.memoryItems[2],
                ],
              ),
              SizedBox(height: height * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  controller.memoryItems[3],
                  controller.memoryItems[4],
                  controller.memoryItems[5],
                ],
              ),
              SizedBox(height: height * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  controller.memoryItems[6],
                  controller.memoryItems[7],
                  controller.memoryItems[8],
                ],
              ),
            ],
          ),
        )
      : Center(
          child: Text(
            (controller.seconds > 0)
            ? controller.seconds.toString()
            : "¡Comenzemos!",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        );
  }
}