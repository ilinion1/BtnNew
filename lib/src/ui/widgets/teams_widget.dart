import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';
import 'package:footbal_app/src/entity/team.dart';

class TeamsWidget extends StatefulWidget {
  const TeamsWidget({
    super.key,
    required this.leagueId,
    required this.teams,
  });

  final int leagueId;
  final List<Team> teams;

  @override
  State<TeamsWidget> createState() => _TeamsWidgetState();
}

class _TeamsWidgetState extends State<TeamsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ColoredBox(
          color: AppColors.backgroundMiddle,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 17.h),
              ),
              SliverToBoxAdapter(
                child: widget.teams.isEmpty
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          SizedBox(width: 35.w),
                          SizedBox(
                            width: 155.w,
                            child: Text(
                              'Team',
                              style: AppTextStyle.tableTitleStyle,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 89.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'M',
                                  style: AppTextStyle.tableTitleStyle,
                                ),
                                Text(
                                  'W',
                                  style: AppTextStyle.tableTitleStyle,
                                ),
                                Text(
                                  'L',
                                  style: AppTextStyle.tableTitleStyle,
                                ),
                                Text(
                                  'D',
                                  style: AppTextStyle.tableTitleStyle,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'PT',
                            style: AppTextStyle.tableTitleStyle,
                          ),
                          SizedBox(width: 41.w),
                        ],
                      ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 11.h),
              ),
              widget.teams.isEmpty
                  ? const SliverToBoxAdapter(
                      child: TeamWidget(),
                    )
                  : SliverFillRemaining(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h),
                        itemCount: widget.teams.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TeamWidget(
                            index: index,
                            team: widget.teams[index],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    this.index,
    this.team,
  });
  final int? index;
  final Team? team;

  @override
  Widget build(BuildContext context) {
    if (team == null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 1.5.h,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: ColoredBox(
            color: AppColors.backgroundLight,
            child: SizedBox(
              width: double.infinity,
              height: 42.h,
              child: Center(
                child: Text(
                  'No teams in this league',
                  style: AppTextStyle.leagueTitle,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 1.5.w,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: ColoredBox(
          color: AppColors.backgroundLight,
          child: SizedBox(
            width: double.infinity,
            height: 42.w,
            child: Row(
              children: [
                SizedBox(
                  width: 35.w,
                  child: Center(child: Text('${index! + 1}')),
                ),
                SizedBox(
                  width: 140.w,
                  child: Row(
                    children: [
                      // SizedBox(width: 15.w),
                      ClipOval(
                        child: Image.network(
                          team!.image,
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          team!.name.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.tableContentStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 89.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        team!.matches.toString(),
                        style: AppTextStyle.tableContentStyle,
                      ),
                      Text(
                        team!.wins.toString(),
                        style: AppTextStyle.tableContentStyle,
                      ),
                      Text(
                        team!.loses.toString(),
                        style: AppTextStyle.tableContentStyle,
                      ),
                      Text(
                        team!.draws.toString(),
                        style: AppTextStyle.tableContentStyle,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  team!.pt.toString(),
                  style: AppTextStyle.tableContentStyle,
                ),
                SizedBox(width: 23.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
