import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ColoredBox(
        color: AppColors.backgroundMiddle,
        child: SizedBox(
          width: 173.w,
          height: 200.h,
        ),
      ),
    );
  }
}
