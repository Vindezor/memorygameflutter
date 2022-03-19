import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/app/ui/game/game_controller.dart';
import 'package:provider/provider.dart';

class MemoryBox extends StatefulWidget {
  final String data;
  final GlobalKey<MemoryBoxState> keyx;
  const MemoryBox({
    required this.data,
    required this.keyx
  }) : super(key: keyx);

  @override
  State<MemoryBox> createState() => MemoryBoxState();
}

class MemoryBoxState extends State<MemoryBox> {
  bool _isActive = false;
  bool _canSnapThis = true;
  bool get isActive{
    return _isActive;
  }

  set setIsActive(bool value){
    setState(() {
      _isActive = value;
    });
  }

  set setCanSnapThis(bool value){
    _canSnapThis = value;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if(controller.canSnap && _canSnapThis){
          controller.selection(widget.keyx);
          setState(() {
            _isActive = !_isActive;
          });
        }
      },
      child: Ink(
        width: width * 0.25,
        height: width * 0.25,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20,
            )
          ],
          color: (_isActive) ? Colors.white : Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: (_isActive)
        ? Center(
          child: AutoSizeText(
            widget.data,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            maxLines: 1,
            )
          )
        : const SizedBox.shrink(),
      ),
    );
  }
}