import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:memorygame/app/ui/game/widgets/memory_box/memory_box_controller.dart';
import 'package:provider/provider.dart';

import '../memory_box/memory_box.dart';

class GameBody extends StatelessWidget {
  const GameBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final controller = Provider.of<GameController>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MemoryBoxController(),
        )
      ],
      child: (controller.gameStarted)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    MemoryBox(),
                    MemoryBox(),
                    MemoryBox(),
                  ],
                ),
                SizedBox(height: height * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    MemoryBox(),
                    MemoryBox(),
                    MemoryBox(),
                  ],
                ),
                SizedBox(height: height * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    MemoryBox(),
                    MemoryBox(),
                    MemoryBox(),
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
          ),
    );
  }
}