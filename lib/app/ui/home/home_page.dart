import 'package:flutter/material.dart';
import 'package:memorygame/app/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Menu",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              child: const Text(
                "Iniciar",
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
                "Acerca de",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () => Navigator.of(context).pushNamed(Routes.ABOUT),
            ),
          ],
        ),
      ),
    );
  }
}