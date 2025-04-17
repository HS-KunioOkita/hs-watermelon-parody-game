import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'login_page.dart';
import 'registration_page.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle), //TODO: テキストをどこかのファイルにまとめた方が改修しやすそう
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
            key: const Key('titleText'),
            children: <Widget>[
              Container(
                // ゲームタイトル
                color: const Color(0xFFFFFFAE),
                child: Text(
                  AppLocalizations.of(context)!.welcomeMessage,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    minimumSize: const Size(320, 44),
                  ),
                  child: Text(AppLocalizations.of(context)!.login),
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
                    minimumSize: const Size(320, 44),
                  ),
                  child: Text(AppLocalizations.of(context)!.userRegistration),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
