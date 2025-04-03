import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hs_watermelon_parody_game/game/game_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      // home: const TopPage(),
      initialRoute: "/top",
      routes: {
        '/top': (context) => const TopPage(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}