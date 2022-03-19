import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:provider/provider.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GameAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: (controller.gameStarted)
      ? Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    "Timeleft",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    controller.seconds.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Column(
              //   children: const [
              //     Text(
              //       "Level",
              //       style: TextStyle(
              //         color: Colors.black,
              //       ),
              //     ),
              //     Text(
              //       "1",
              //       style: TextStyle(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ],
              // ),
              Column(
                children: const [
                  Text(
                    "Score",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
      : const SizedBox.shrink()
    );
  }
}