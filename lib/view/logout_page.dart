import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/game/game_screen.dart';
import 'login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //中央揃え
        child: Column(
          //要素を縦に並べる
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color(0xFFFFFFAE),
              child: const Text(
                'ログアウトしますか',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 44.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 44),
                ),
                child: const Text('はい'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 44),
                ),
                child: const Text('いいえ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}