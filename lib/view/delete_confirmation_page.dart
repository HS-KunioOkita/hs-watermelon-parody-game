import 'package:flutter/material.dart';
import 'delete_completed_page.dart';
import 'login_page.dart';
import 'registration_page.dart';

class DeleteConfirmationPage extends StatelessWidget {
  final String userName;
  final String loginId;

  const DeleteConfirmationPage({super.key, required this.userName, required this.loginId});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ退会確認'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color(0xFFFFFFAE),
              child: const Text(
                '以下のアカウントで退会しますか？',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: TextFormField(
                initialValue: userName,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: "UserName",
                  border: OutlineInputBorder(),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                  initialValue: loginId,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: "LoginID",
                    border: OutlineInputBorder(),
                  )
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 16.0),
            //   child: TextFormField(
            //       initialValue: ,
            //       decoration: const InputDecoration(
            //         labelText: "PassWord",
            //         border: OutlineInputBorder(),
            //       )
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: ユーザ登録処理を実装する、登録が完了したら完了画面気遷移
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteCompletedPage()
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  // 幅320、高さ44
                  minimumSize: const Size(320, 44),
                ),
                child: const Text('退会する'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
