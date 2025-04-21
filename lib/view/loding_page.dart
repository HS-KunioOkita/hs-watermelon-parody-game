import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _isInitialized = true;
      _loadResources();
    }
  }

  Future<void> _loadResources() async {
    await precacheImage(
      // TOPページ用の背景画像を先に読み込んで、描画遅延を抑止する
      const AssetImage('images/background-fruits.jpg'),
      context,
    );
    // 読み込みが早すぎるとLoading画面が一瞬しか表示されず、ちらつきと勘違いされるためdelayさせる
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/top');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // flutter_native_splash.yaml で指定したcolorと同じにする
      backgroundColor: Color(0xFFFFFFCC),
      body: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}
