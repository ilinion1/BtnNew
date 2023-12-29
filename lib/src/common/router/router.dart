import 'package:flutter/material.dart';
import 'package:footbal_app/src/common/widgets/app_bottom_bar.dart';
import 'package:footbal_app/src/entity/league.dart';
import 'package:footbal_app/src/entity/news.dart';
import 'package:footbal_app/src/game/home_page.dart';
import 'package:footbal_app/src/ui/pages/get_started_page.dart';
import 'package:footbal_app/src/ui/pages/league_page.dart';
import 'package:footbal_app/src/ui/pages/news_detail_page.dart';
import 'package:footbal_app/src/ui/pages/news_list_page.dart';
import 'package:footbal_app/src/ui/pages/quiz_page.dart';
import 'package:footbal_app/src/ui/pages/teams_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouterUrl {
  static const loader = '/';
}

abstract class AppRouter {
  static RouterConfig<Object>? router() {
    final GlobalKey<NavigatorState> rootNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'root');
    final GlobalKey<NavigatorState> homeNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'home');
    final GlobalKey<NavigatorState> newsNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'news');
    final GlobalKey<NavigatorState> gameNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'game');
    final GlobalKey<NavigatorState> quizNavigatorKey =
        GlobalKey<NavigatorState>(debugLabel: 'quiz');

    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: AppRouterUrl.loader,
          builder: (BuildContext context, GoRouterState state) {
            return const GetStartedPage();
          },
        ),
        // GoRoute(
        //   parentNavigatorKey: rootNavigatorKey,
        //   path: '/profile',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return UserPage(isPop: true);
        //   },
        // ),
        // GoRoute(
        //   path: AppRouterUrl.auth,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return AuthPage();
        //   },
        //   routes: [
        //     GoRoute(
        //       path: 'registration',
        //       name: 'registration',
        //       builder: (BuildContext context, GoRouterState state) =>
        //           const RegistrationPage(),
        //     ),
        //   ],
        // ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppBottomNavBar(
            navigationShell: navigationShell,
          ),
          branches: [
            StatefulShellBranch(
              navigatorKey: homeNavigatorKey,
              routes: [
                GoRoute(
                  // path: AppRouterUrl.training,
                  path: '/league',
                  name: 'league',
                  builder: (BuildContext context, GoRouterState state) {
                    return const LeaguePage();
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      path: 'teams',
                      name: 'teams',
                      builder: (BuildContext context, GoRouterState state) {
                        final League league = state.extra as League;
                        return TeamsPage(league: league);
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: newsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/news',
                  builder: (BuildContext context, GoRouterState state) {
                    return const NewsListPage();
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      path: 'news_detail',
                      name: 'news_detail',
                      builder: (BuildContext context, GoRouterState state) {
                        final News news = state.extra as News;
                        return NewsDetailPage(news: news);
                      },
                    )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: quizNavigatorKey,
              routes: [
                GoRoute(
                  path: '/quiz',
                  builder: (BuildContext context, GoRouterState state) {
                    return const QuizPage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: gameNavigatorKey,
              routes: [
                GoRoute(
                  path: '/game',
                  builder: (BuildContext context, GoRouterState state) {
                    return const GamePage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
