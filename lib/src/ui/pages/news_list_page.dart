import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/data/news_api.dart';
import 'package:footbal_app/src/entity/news.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  Future<List<News>> _loadNews() async {
    final newsList = await NewsApi.getNews();
    return newsList;
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
            'News',
            style: AppTextStyle.leagueTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        body: FutureBuilder(
          future: _loadNews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final newsList = snapshot.data as List<News>;
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 16.h,
                  bottom: 10.h,
                  left: 16.w,
                  right: 16.w,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 160 / 200,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _NewsWidget(
                    newsList: newsList,
                    index: index,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class _NewsWidget extends StatelessWidget {
  const _NewsWidget({
    required List<News> newsList,
    required this.index,
  }) : _newsList = newsList;

  final List<News> _newsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ColoredBox(
        color: AppColors.backgroundMiddle,
        child: GestureDetector(
          onTap: () {
            context.goNamed(
              'news_detail',
              extra: _newsList[index],
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => NewsDetailPage(
            //       news: _newsList[index],
            //     ),
            //   ),
            // );
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
