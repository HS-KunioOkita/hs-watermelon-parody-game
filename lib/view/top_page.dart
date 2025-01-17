import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スイカゲーム'), //TODO: テキストをどこかのファイルにまとめた方が改修しやすそう
      ),
      body: Container(
        //背景画像
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background-fruits.jpg'),
          fit: BoxFit.fitHeight,
        )),
        child: Center(
          //中央揃え
          child: Column(
            //要素を縦に並べる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // ゲームタイトル
                color: const Color(0xFFFFFFAE),
                child: const Text(
                  'スイカゲームへようこそ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 44.0),
                // ログインボタン
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // 幅320、高さ44
                    minimumSize: const Size(320, 44),
                  ),
                  child: const Text('ログイン'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                // ユーザ登録ボタン
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // 幅320、高さ44
                    minimumSize: const Size(320, 44),
                  ),
                  child: const Text('ユーザ登録'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
