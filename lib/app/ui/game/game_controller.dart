import 'dart:async';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorygame/app/routes/routes.dart';
import 'package:memorygame/app/ui/game/widgets/memory_box/memory_box.dart';

class GameController extends ChangeNotifier {
  GameController(this.context);
  final BuildContext context;
  static const int maxSeconds = 60;
  int _seconds = 3;
  int _score = 0;
  bool _gameStarted = false;
  Timer? timer;
  List<MemoryBox> memoryItems = [];
  List<GlobalKey<MemoryBoxState>> keys = [];
  bool _canSnap = true;

  int get seconds {
    return _seconds;
  }

  bool get canSnap{
    return _canSnap;
  }

  bool get gameStarted {
    return _gameStarted;
  }

  int get score {
    return _score;
  }

  void startCountDown(){
    _seconds = 3;
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (_) { 
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        stopTimer();
        startTimer();
      }
    });
  }

  void startTimer(){
    _gameStarted = true;
    _seconds = maxSeconds;
    notifyListeners();
    timer = Timer.periodic(const Duration(seconds: 1), (_) { 
      if(_seconds > 0){
        _seconds--;
        notifyListeners();
      } else{
        Navigator.of(context).pushReplacementNamed(Routes.LOSE);
        stopTimer();
      }
    });
  }

  void stopTimer(){
    timer!.cancel();
  }

  void setItems(){
    final random = Random();
    for(int i = 0; i<4; i++){
      final word = nouns[random.nextInt(nouns.length)];
      memoryItems.add(MemoryBox(keyx: GlobalKey<MemoryBoxState>(), data: word));
      memoryItems.add(MemoryBox(keyx: GlobalKey<MemoryBoxState>(), data: word));
    }
    memoryItems.add(MemoryBox(keyx: GlobalKey<MemoryBoxState>(), data: "Bomb"));
    memoryItems.shuffle();
  }

  void selection(GlobalKey<MemoryBoxState> key){
    if(keys.length < 2){
      if(key.currentState!.widget.data == "Bomb"){
        _canSnap = false;
        Future.delayed(
          const Duration(seconds: 2)
        ).then(
          (_) => Navigator.pushReplacementNamed(context, Routes.LOSE)
        );
      } else{
        keys.add(key);
        if(keys.length == 2){
          _canSnap = false;
          checkKeys();
        }
      }
    }
  }

  void checkKeys(){
    if(keys[0].currentState!.widget.data == keys[1].currentState!.widget.data){
      _score++;
      keys[0].currentState!.setCanSnapThis = false;
      keys[1].currentState!.setCanSnapThis = false;
      keys.clear();
      _canSnap = true;
    } else{
      Future.delayed(const Duration(seconds: 2)).then((_) {
        keys[0].currentState!.setIsActive = false;
        keys[1].currentState!.setIsActive = false;
        _score--;
        keys.clear();
        _canSnap = true;
      });
    }

  }

  @override
  void dispose() {
    print("disposed");
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
}