import 'package:flutter/material.dart';
import '../component/login_button.dart';
import '../router/app_router.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Game Title!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            LoginButton(
              onPressed: () {
                Navigator.push(
                  context,
                  AppRouter.loginPageRoute(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
