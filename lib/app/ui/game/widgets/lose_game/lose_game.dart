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
    return Scaffold(
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
                onPressed: () => Navigator.of(context).pushNamed(Routes.GAME),
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
                onPressed: () => Navigator.of(context).pushNamed(Routes.HOME),
              ),
            ],
          )
        ],
      ),
    );
  }
}