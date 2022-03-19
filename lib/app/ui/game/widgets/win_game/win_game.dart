import 'package:flutter/material.dart';
import 'package:memorygame/app/routes/routes.dart';

class WinGamePage extends StatefulWidget {
  const WinGamePage({ Key? key }) : super(key: key);

  @override
  State<WinGamePage> createState() => _WinGamePageState();
}

class _WinGamePageState extends State<WinGamePage> {
  @override
  Widget build(BuildContext context) {
    final score = (ModalRoute.of(context)!.settings.arguments as Map)['score'];
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                "You win",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Score: $score",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    "Play Again",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(Routes.GAME),
                ),
                TextButton(
                  child: const Text(
                    "Home Page",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}