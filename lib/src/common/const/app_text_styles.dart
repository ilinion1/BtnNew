import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';

abstract class AppTextStyle {
  static final leagueTitle = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static final tabStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static final tabbarTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final tableContentStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static final tableTitleStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.orange,
  );

  static final newsTitleStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static final newsContentStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  );
}
