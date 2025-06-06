import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'delete_confirmation_page.dart';

class DeleteFormsPage extends StatefulWidget {
  const DeleteFormsPage({super.key});

  @override
  State<DeleteFormsPage> createState() => _DeleteFormsPage();
}

class _DeleteFormsPage extends State<DeleteFormsPage> {
  String userName = "";
  String loginId = "";
  String passWord = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.userDelete),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color(0xFFFFFFAE),
              child: Text(
                AppLocalizations.of(context)!.userDeleteInputInfo,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
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
                      return AppLocalizations.of(context)!.errorNoValue;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.loginId,
                    border: const OutlineInputBorder(),
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
                  //     return AppLocalizations.of(context)!.errorNoValue;
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.passWord,
                    border: const OutlineInputBorder(),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeleteConfirmationPage(loginId: loginId, userName: 'ユーザ名',)
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  // 幅320、高さ44
                  minimumSize: const Size(320, 44),
                ),
                child: Text(AppLocalizations.of(context)!.userDeleteConfirm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
