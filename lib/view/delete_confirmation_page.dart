import 'package:flutter/material.dart';
import 'delete_completed_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DeleteConfirmationPage extends StatelessWidget {
  final String userName;
  final String loginId;

  const DeleteConfirmationPage({super.key, required this.userName, required this.loginId});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.userDeleteConfirm),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: const Color(0xFFFFFFAE),
              child: Text(
                AppLocalizations.of(context)!.userDeleteCheckAccount,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: TextFormField(
                initialValue: userName,
                enabled: false,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.userName,
                  border: const OutlineInputBorder(),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                  initialValue: loginId,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.loginId,
                    border: const OutlineInputBorder(),
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
                child: Text(AppLocalizations.of(context)!.userDeleteExecute),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
