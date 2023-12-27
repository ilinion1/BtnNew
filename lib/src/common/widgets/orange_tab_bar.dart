import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_images.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';

class OrangeTabBar extends StatelessWidget {
  const OrangeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: SizedBox(
        height: 110.w,
        width: double.infinity,
        child: ColoredBox(
          color: AppColors.orange,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Ride 17 of 38',
                    style: AppTextStyle.tabbarTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Image.asset(
                AppImages.orangeBackground,
                width: 165.w,
                height: 154.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
