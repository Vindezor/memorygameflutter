import 'package:flutter/material.dart';
import 'package:memorygame/app/routes/routes.dart';

class LoseGamePage extends StatefulWidget {
  const LoseGamePage({ Key? key }) : super(key: key);

  @override
  State<LoseGamePage> createState() => _LoseGamePageState();
}

class _LoseGamePageState extends State<LoseGamePage> {
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
                "You lose",
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
                    "Retry",
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