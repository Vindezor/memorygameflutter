import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/widgets/memory_box.dart';

class GameBody extends StatelessWidget {
  const GameBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
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
    );
  }
}