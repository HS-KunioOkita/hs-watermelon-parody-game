import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログアウト'),
        automaticallyImplyLeading: false,
      ),
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
                  Navigator.popUntil(
                      context, ModalRoute.withName("/top")
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
                  Navigator.pop(
                    context,
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