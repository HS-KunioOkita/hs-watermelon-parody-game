import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.logOut),
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
              child: Text(
                AppLocalizations.of(context)!.logOutConfirm,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                child: Text(AppLocalizations.of(context)!.yes),
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
                child: Text(AppLocalizations.of(context)!.no)
              ),
            ),
          ],
        ),
      ),
    );
  }
}