import 'package:flutter/material.dart';

class MemoryBox extends StatelessWidget {
  const MemoryBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => {},
      child: Ink(
        width: width * 0.25,
        height: width * 0.25,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}