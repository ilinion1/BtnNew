import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_images.dart';

class MyBall extends StatelessWidget {
  final double x;
  final double y;
  final bool gameHasStarted;

  const MyBall({
    Key? key,
    required this.x,
    required this.y,
    required this.gameHasStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
        ? Container(
            alignment: Alignment(x, y),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(AppImages.ball),
                ),
              ),
              width: 30.r,
              height: 30.r,
            ),
          )
        : Container(
            alignment: Alignment(x, y),
            child: Material(
              elevation: 8,
              shape: const CircleBorder(),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(AppImages.ball),
                  ),
                  // borderRadius: BorderRadius.circular(30.r),
                ),
                width: 30.r,
                height: 30.r,
              ),
            ),
          );
  }
}
