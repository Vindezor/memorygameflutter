import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorygame/app/ui/game/widgets/memory_box/memory_box.dart';

class MemoryBoxController extends ChangeNotifier {
  List<MemoryBox> memoryItems = [];

  void setItems(){
    final random = Random();
    for(int i = 0; i<4; i++){
      final word = nouns[random.nextInt(2000)];
      memoryItems.add(MemoryBox(data: word));
      memoryItems.add(MemoryBox(data: word));
    }
    memoryItems.add(const MemoryBox(data: "Bomb"));
    memoryItems.shuffle();
  }
}