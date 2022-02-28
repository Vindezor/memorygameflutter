import 'package:flutter/material.dart';
import 'package:memorygame/app/routes/pages.dart';
import 'package:memorygame/app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes(),
      initialRoute: Routes.SPLASH,
    );
  }
}