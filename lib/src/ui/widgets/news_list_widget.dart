import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/entity/league.dart';
import 'package:footbal_app/src/entity/news.dart';
import 'package:footbal_app/src/ui/pages/news_detail_page.dart';
import 'package:intl/intl.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    super.key,
    required List<News> newsList,
    required this.league,
  }) : _newsList = newsList;

  final List<News> _newsList;
  final League league;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160 / 200,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: _newsList.length,
      itemBuilder: (BuildContext context, int index) {
        return _NewsWidget(
          newsList: _newsList,
          league: league,
          index: index,
        );
      },
    );
  }
}

class _NewsWidget extends StatelessWidget {
  const _NewsWidget({
    super.key,
    required List<News> newsList,
    required this.league,
    required this.index,
  }) : _newsList = newsList;

  final List<News> _newsList;
  final League league;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ColoredBox(
        color: AppColors.backgroundMiddle,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                  news: _newsList[index],
                  league: league,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: 9.h,
              left: 10.w,
              right: 10.w,
              bottom: 13.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    _newsList[index].image,
                    width: 153.w,
                    height: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  _newsList[index].title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('dd MMMM').format(
                    (index < 4)
                        ? DateTime.now()
                        : (index < 8)
                            ? (DateTime.now().subtract(const Duration(days: 1)))
                            : DateTime.now().subtract(const Duration(days: 2)),
                  ),
                  maxLines: 1,
                  style: const TextStyle(color: AppColors.orange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
