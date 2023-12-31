import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final bool gameHasStarted;
  final int enemyScore;
  final int playerScore;

  const ScoreScreen({
    Key? key,
    required this.gameHasStarted,
    required this.enemyScore,
    required this.playerScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, 0),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 4,
                  color: Colors.grey.shade800,
                ),
              ),
              Container(
                alignment: const Alignment(0, -0.3),
                child: Text(
                  enemyScore.toString(),
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 100,
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.3),
                child: Text(
                  playerScore.toString(),
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 100,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
