import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_icons.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _currentIndex = 0;

  void onTap(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      // extendBody: true,
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60.h,
          child: ColoredBox(
            color: AppColors.backgroundMiddle,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomBarItem(
                  index: 0,
                  isActive: _currentIndex == 0,
                  icon: AppIcons.home,
                ),
                _BottomBarItem(
                  index: 1,
                  isActive: _currentIndex == 1,
                  icon: AppIcons.news,
                ),
                _BottomBarItem(
                  index: 2,
                  isActive: _currentIndex == 2,
                  icon: AppIcons.quizlet,
                ),
                _BottomBarItem(
                  index: 3,
                  isActive: _currentIndex == 3,
                  icon: AppIcons.soccerField,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({
    required this.index,
    required this.isActive,
    required this.icon,
  });

  final int index;
  final bool isActive;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: () {
        context.findAncestorStateOfType<_AppBottomNavBarState>()?.onTap(index);
      },
      icon: SvgPicture.asset(
        index == 3 && isActive ? AppIcons.soccerFieldActive : icon,
        colorFilter: (isActive && (index != 3))
            ? const ColorFilter.mode(
                AppColors.orange,
                BlendMode.srcIn,
              )
            : null,
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
