// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hs_watermelon_parody_game/view/top_page.dart';

void main() {
  //todo: 以下のテストはGithubAction を成功させるために実装したものです。テストコードを追加したら削除してください！！
  testWidgets('TopPage', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TopPage(),
      ),
    );

    // Tapボタンを検索
    final text = find.byKey(const Key('titleText'));
    expect(text, findsOneWidget);
  });
}
