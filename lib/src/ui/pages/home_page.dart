import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/common/widgets/orange_tab_bar.dart';
import 'package:footbal_app/src/data/news_api.dart';
import 'package:footbal_app/src/data/teams_api.dart';
import 'package:footbal_app/src/entity/league.dart';
import 'package:footbal_app/src/entity/news.dart';
import 'package:footbal_app/src/entity/team.dart';
import 'package:footbal_app/src/ui/widgets/news_list_widget.dart';
import 'package:footbal_app/src/ui/widgets/teams_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.league,
  });

  final League league;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<News>> _loadNews() async {
    final newsList = await NewsApi.getNews(widget.league.id);
    return newsList;
  }

  Future<List<Team>?> _loadTeams() async {
    final teams = (await TeamsApi.getTeams(
      widget.league.id,
      "2022",
    ))
        .toList();
    return teams;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientBackground,
      ),
      child: DefaultTabController(
        length: 2,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const OrangeTabBar(),
                      TabBar(
                        tabAlignment: TabAlignment.start,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 4,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        labelStyle: AppTextStyle.tabStyle,
                        tabs: const [
                          Tab(text: 'News'),
                          Tab(text: 'Tables'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: TabBarView(
                    children: [
                      FutureBuilder(
                        future: _loadNews(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return NewsListWidget(
                              newsList: snapshot.data as List<News>,
                              league: widget.league,
                            );
                          }
                        },
                      ),
                      FutureBuilder(
                        future: _loadTeams(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            final teams = snapshot.data as List<Team>;
                            return TeamsWidget(
                              leagueId: widget.league.id,
                              teams: teams,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
