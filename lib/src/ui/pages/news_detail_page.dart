import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/data/news_api.dart';
import 'package:footbal_app/src/entity/league.dart';
import 'package:footbal_app/src/entity/news.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.news,
    required this.league,
  });

  final News news;
  final League league;

  @override
  State<NewsDetailPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsDetailPage> {
  Future<List<String>> _loadNews() async {
    final content =
        await NewsApi.getPostContentHtml(postUrl: widget.news.detailUrl);
    return content;
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
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.network(
                  widget.league.logo,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  widget.league.name,
                  style: AppTextStyle.leagueTitle,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: ColoredBox(
                color: AppColors.backgroundMiddle,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        widget.news.image,
                        width: double.infinity,
                        height: 233.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        widget.news.title,
                        style: AppTextStyle.newsTitleStyle,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    FutureBuilder(
                      future: _loadNews(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: (snapshot.data! as List<String>)
                                  .map((String p) => Text(
                                        p == '' ? p : '$p\n',
                                        style: AppTextStyle.newsContentStyle,
                                      ))
                                  .toList(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
