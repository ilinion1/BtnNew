import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/ui/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<bool> _loadData() async {
  //   final first = await FirstOpenStorage.getFirst();
  //   if (first == null) return true;
  //   return first;
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: AppColors.orange,
          ),
        ),
        themeMode: ThemeMode.dark,
        title: 'Football App',
        home: const GetStartedPage(),
        // home: FutureBuilder(
        //   future: _loadData(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (!snapshot.hasData) {
        //       return const GetStartedPage(isLoading: true);
        //     } else if ((snapshot.data as bool)) {
        //       return const GetStartedPage();
        //     } else {
        //       return const LeaguePage();
        //     }
        //   },
        // ),
      ),
    );
  }
}
