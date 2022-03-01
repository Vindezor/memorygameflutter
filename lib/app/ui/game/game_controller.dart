import 'dart:async';

import 'package:flutter/cupertino.dart';

class GameController extends ChangeNotifier {
  static const int maxSeconds = 60;
  int _seconds = 3;
  bool _gameStarted = false;
  Timer? timer;
  
  int get seconds {
    return _seconds;
  }

  bool get gameStarted {
    return _gameStarted;
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
        stopTimer();
      }
    });
  }

  void stopTimer(){
    timer!.cancel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }
}