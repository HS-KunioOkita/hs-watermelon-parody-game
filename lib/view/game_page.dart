// game_page.dart
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:hs_watermelon_parody_game/view/delete_forms_page.dart';
import 'package:hs_watermelon_parody_game/view/logout_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../game/my_game.dart';
import 'package:hs_watermelon_parody_game/game/game_ui_object.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final game = GameUIObject(screenSize: screenSize);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () async {
              final currentContext = context; // BuildContext を保持

              final result = await showMenu<int>(
                context: currentContext,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(AppLocalizations.of(currentContext)!.logOut),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(AppLocalizations.of(currentContext)!.titleBack),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(AppLocalizations.of(currentContext)!.userDelete),
                  ),
                ],
                elevation: 8.0,
              );

              // Flutter 3.19以降では、こうやって守るべし！
              if (!currentContext.mounted) return;

              if (result != null) {
                switch (result) {
                  case 0:
                    Navigator.push(
                      currentContext,
                      MaterialPageRoute(
                        builder: (_) => const LogoutPage(),
                      ),
                    );
                    break;
                  case 1:
                    showDialog(
                      context: currentContext,
                      builder: (_) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(currentContext)!.titleBackConfirm),
                          actions: <Widget>[
                            TextButton(
                              child: Text(AppLocalizations.of(currentContext)!.yes),
                              onPressed: () {
                                Navigator.popUntil(
                                  currentContext,
                                  ModalRoute.withName("/top"),
                                );
                              },
                            ),
                            TextButton(
                              child: Text(AppLocalizations.of(currentContext)!.no),
                              onPressed: () => Navigator.pop(currentContext),
                            ),
                          ],
                        );
                      },
                    );
                    break;
                  case 2:
                    Navigator.push(
                      currentContext,
                      MaterialPageRoute(
                        builder: (_) => const DeleteFormsPage(),
                      ),
                    );
                    break;
                }
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            top: 0,
            left: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier<int>(game.score),
                  builder: (context, score, _) {
                    return Text(
                      'Score\n $score',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier<int>(game.bestScore),
                  builder: (context, bestScore, _) {
                    return Text(
                      'BestScore \n $bestScore',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier<int>(game.bestScore),
                  builder: (context, bestScore, _) {
                    return const Text(
                      '次のボール',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}