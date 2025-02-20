import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/game/game_screen.dart';
import 'view/top_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Top Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TopPage(),
      initialRoute: "/top",
      routes: {
        '/top': (context) => const TopPage(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
