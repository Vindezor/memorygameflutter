import 'package:flutter/material.dart';

class MemoryBox extends StatefulWidget {
  final String data;
  const MemoryBox({
    required this.data,
    Key? key 
  }) : super(key: key);

  @override
  State<MemoryBox> createState() => _MemoryBoxState();
}

class _MemoryBoxState extends State<MemoryBox> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
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
          child: Text(
            widget.data,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            )
          )
        : const SizedBox.shrink(),
      ),
    );
  }
}