import 'package:flutter/material.dart';
import 'package:memorygame/app/routes/routes.dart';
import 'package:memorygame/app/ui/about/about_page.dart';
import 'package:memorygame/app/ui/game/game_page.dart';
import 'package:memorygame/app/ui/home/home_page.dart';
import 'package:memorygame/app/ui/splash/splash_page.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.ABOUT: (_) => const AboutPage(),
    Routes.GAME: (_) => const GamePage(),
  };
}