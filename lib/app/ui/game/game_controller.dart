import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:memorygame/app/routes/routes.dart';

class GameController extends ChangeNotifier {
  GameController(this.context);

  final BuildContext context;
  static const int maxSeconds = 5;
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
//1
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

  @override
  void dispose() {
    print("disposed");
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
}