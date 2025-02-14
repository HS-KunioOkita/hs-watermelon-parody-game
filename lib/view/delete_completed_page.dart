import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hs_watermelon_parody_game/view/top_page.dart';

class DeleteCompletedPage extends StatefulWidget {
  const DeleteCompletedPage({super.key});

  @override
  State<DeleteCompletedPage> createState() => _DeleteCompletedPage();
}

class _DeleteCompletedPage extends State<DeleteCompletedPage> {
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
  // Widget（画面）が破棄された時に呼ばれるメソッド
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ユーザ大会完了'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // ゲームタイトル
                color: const Color(0xFFFFFFAE),
                child: const Text(
                  '退会が完了しました',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
    );
  }
}
