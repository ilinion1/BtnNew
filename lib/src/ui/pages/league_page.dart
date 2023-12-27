import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/data/league_api.dart';
import 'package:footbal_app/src/entity/league.dart';
import 'package:footbal_app/src/ui/pages/home_page.dart';

class LeaguePage extends StatefulWidget {
  const LeaguePage({super.key});

  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  Future<List<League>> _loadLeagues() async {
    final leagues = (await LeagueApi.getLeagues()).toList();
    return leagues;
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
          excludeHeaderSemantics: false,
          backgroundColor: Colors.transparent,
          title: Text(
            'Select League',
            style: AppTextStyle.leagueTitle,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _loadLeagues(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final leagues = snapshot.data as List<League>;
              return ListView.builder(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 40.h),
                itemCount: leagues.length,
                itemBuilder: (BuildContext context, int index) {
                  final league = leagues[index];
                  return _LeagueWidget(league: league);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class _LeagueWidget extends StatelessWidget {
  const _LeagueWidget({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                league: league,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: ColoredBox(
            color: AppColors.backgroundMiddle,
            child: SizedBox(
              width: double.infinity,
              height: 90.h,
              child: Row(
                children: [
                  SizedBox(width: 17.w),
                  ClipOval(
                    child: Image.network(
                      league.logo,
                      width: 56.r,
                      height: 56.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 21.w),
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      league.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
