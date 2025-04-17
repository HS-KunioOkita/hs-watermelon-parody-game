import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RegistrationCompletePage extends StatefulWidget {
  const RegistrationCompletePage({super.key});

  @override
  State<RegistrationCompletePage> createState() => _RegistrationCompletePage();
}

class _RegistrationCompletePage extends State<RegistrationCompletePage> {
  Timer? timer;

  @override
  // 画面初期化時に呼ばれるメソッド
  void initState() {
    super.initState();

    //Timerのインスタンスを作る
    //Timerの引数は遅延時間(Duration)と経過時間後の操作を記したコールバック関数の二つを搭載する
    timer = Timer(
      const Duration(seconds: 2),
      () {
        // コールバックを渡しておく。ここに遷移メソッドは書いておく
        Navigator.popUntil(
            context, ModalRoute.withName("/top")
        );
      },
    );
  }

  @override
  // Widget（画面）が破棄された時に呼ばれるメソッド
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.userRegistrationCompleted),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // ゲームタイトル
              color: const Color(0xFFFFFFAE),
              child:  Text(
                AppLocalizations.of(context)!.userRegistrationHasCompleted,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )
    );
  }
}
