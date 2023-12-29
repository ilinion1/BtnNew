import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_images.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/game/ball.dart';
import 'package:footbal_app/src/game/brick.dart';
import 'package:footbal_app/src/game/coverscreen.dart';
import 'package:go_router/go_router.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _HomePageState();
}

enum Direction { up, down, left, right }

class _HomePageState extends State<GamePage> {
  // player variables (bottom brick)
  double playerX = -0.1;
  double brickWidth = 0.2; // out of 2
  int playerScore = 0;

  // enemy variables (top brick)
  double enemyX = -0.1;
  int enemyScore = 0;

  // ball variables
  double ballX = 0;
  double ballY = 0;
  var ballYDirection = Direction.down;
  var ballXDirection = Direction.left;

  // game settings
  bool gameHasStarted = false;

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 3), (timer) {
      // update direction;
      updateDirection();
      //move ball
      moveBall();
      // move enemy
      moveEnemy();
      // check if player is dead
      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _showDialog(false);
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _showDialog(true);
      }
    });
  }

  bool isEnemyDead() {
    if (ballY <= -0.85 && ballX >= -0.2 && ballX <= 0.2) {
      return true;
    }
    return false;
  }

  void moveEnemy() {
    setState(() {
      enemyX = ballX;
    });
  }

  void _showDialog(bool enemyDied) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.orange,
            title: Center(
              child: Text(
                enemyDied ? "YOU WON!" : "YOU LOSE!",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(7),
                    child: const Text(
                      "PLAY AGAIN",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void resetGame() {
    context.pop();
    setState(() {
      gameHasStarted = false;
      ballX = 0;
      ballY = 0;
      playerX = -0.1;
      enemyX = -0.1;
    });
  }

  bool isPlayerDead() {
    if (ballY >= 0.85 && ballX >= -0.2 && ballX <= 0.2) {
      return true;
    }
    return false;
  }

  void updateDirection() {
    // print(ballX);
    setState(() {
      // update vertical direction
      // if (ballY >= 0.7 && playerX + brickWidth >= ballX && playerX <= ballX) {
      if (ballY >= 0.85) {
        ballYDirection = Direction.up;
      }
      if (ballY >= 0.8 && playerX + brickWidth >= ballX && playerX <= ballX) {
        ballYDirection = Direction.up;
      } else if (ballY <= -0.8) {
        ballYDirection = Direction.down;
      }
      // update horizontal direction
      if (ballX >= 1) {
        ballXDirection = Direction.left;
      } else if (ballX <= -1) {
        ballXDirection = Direction.right;
      }
    });
  }

  void moveBall() {
    setState(() {
      // vertical movement
      if (ballYDirection == Direction.down) {
        ballY += 0.003;
      } else if (ballYDirection == Direction.up) {
        ballY -= 0.003;
      }
      // horizontal movement
      if (ballXDirection == Direction.left) {
        ballX -= 0.003;
      } else if (ballXDirection == Direction.right) {
        ballX += 0.003;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Game',
            style: AppTextStyle.leagueTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                // Обновление координат игрока
                playerX += details.delta.dx / 150;
              });
            },
            child: GestureDetector(
              onTap: gameHasStarted ? null : startGame,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(AppImages.gameBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  // backgroundColor: Colors.grey.shade900,
                  body: Center(
                    child: Stack(
                      children: [
                        // tap to play
                        CoverScreen(
                          gameHasStarted: gameHasStarted,
                        ),
                        // score screen
                        // ScoreScreen(
                        //   gameHasStarted: gameHasStarted,
                        //   enemyScore: enemyScore,
                        //   playerScore: playerScore,
                        // ),
                        // enemy (top brick)
                        MyBrick(
                          x: enemyX,
                          y: -0.8,
                          brickWidth: brickWidth,
                          thisIsEnemy: true,
                        ),
                        // player (bottom brick)
                        MyBrick(
                          x: playerX,
                          y: 0.8,
                          brickWidth: brickWidth,
                          thisIsEnemy: false,
                        ),
                        // ball
                        MyBall(
                          x: ballX,
                          y: ballY,
                          gameHasStarted: gameHasStarted,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
