import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/view/top_page.dart';

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
      const Duration(seconds: 2), //遅延時間＝2秒
      () {
        // コールバックを渡しておく。ここに遷移メソッドは書いておく
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopPage(),
          ),
        );
      },
    );
  }

  @override
  // Widget が破棄された時に呼ばれるメソッド
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザ登録完了'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // ゲームタイトル
              color: const Color(0xFFFFFFAE),
              child: const Text(
                '登録が完了しました',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )
    );
  }
}
