import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_images.dart';
import 'package:footbal_app/src/ui/pages/league_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({
    super.key,
    // this.isLoading = false,
  });

  // final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Column(
        children: [
          SizedBox(height: 70.h),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            fit: StackFit.loose,
            children: [
              ClipOval(
                child: ColoredBox(
                  color: AppColors.background,
                  child: SizedBox(
                    width: 256.r,
                    height: 256.r,
                  ),
                ),
              ),
              Image.asset(
                AppImages.splashScreen,
                height: 347.r,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(height: 1),
              children: [
                TextSpan(
                  text: 'Welcome to\n',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 34.sp,
                        fontFamily: 'Poppins',
                        height: 1,
                      ),
                ),
                TextSpan(
                  text: 'Betan Sport News',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 34.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.background,
                        height: 1,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              'Immerse yourself in the world of football. Follow the latest news and all events in the world of football and sports',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 49.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: SizedBox(
              height: 64.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LeaguePage(),
                    ),
                  );
                },
                child: Text(
                  'Continue',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Poppins',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
