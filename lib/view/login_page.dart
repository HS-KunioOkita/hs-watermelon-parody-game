import 'package:flutter/material.dart';
import 'game_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            TextFormField(
              controller: TextEditingController(),
              onFieldSubmitted: (value) {
                // TODO: エンターキーを押した時の処理
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   TODO: バリデーションを実装できる
              //   if(value == null || value.isEmpty) {
              //     // エラーメッセージ
              //     return '値を入力してください';
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.loginId,
                border: const OutlineInputBorder(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                controller: TextEditingController(),
                onFieldSubmitted: (value) {
                  // TODO:エンターキーを押した時の処理
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   TODO: バリデーションを実装できる
                //   if(value == null || value.isEmpty) {
                //     // エラーメッセージ
                //     return '値を入力してください';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.passWord,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: ここにAuth処理を呼び出すメソッドを記載する
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 44),
                ),
                child: Text(AppLocalizations.of(context)!.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
