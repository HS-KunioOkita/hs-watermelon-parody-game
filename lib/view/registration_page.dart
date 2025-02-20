import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/view/registration_complete_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  String userName = "";
  String loginId = "";
  String passWord = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: TextEditingController(),
              onChanged: (value) {
                userName = value;
              },
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
              decoration: const InputDecoration(
                labelText: "UserName",
                border: OutlineInputBorder(),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                controller: TextEditingController(),
                  onChanged: (value) {
                    loginId = value;
                  },
                onFieldSubmitted: (value) {
                  // TODO:エンターキーを押した時の処理
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  // TODO: バリデーションを実装できる
                  if(value == null || value.isEmpty) {
                    // エラーメッセージ
                    return '値を入力してください';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "LoginID",
                  border: OutlineInputBorder(),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                controller: TextEditingController(),
                  onChanged: (value) {
                    passWord = value;
                  },
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
                decoration: const InputDecoration(
                  labelText: "PassWord",
                  border: OutlineInputBorder(),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: ユーザ登録処理を実装する、登録が完了したら完了画面気遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationCompletePage()
                    )
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
    );
  }
}
