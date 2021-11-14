// @dart = 2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/main_cubit/cubit.dart';
import 'package:news_app/shared/main_cubit/states.dart';
import 'package:news_app/shared/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //because main() is async
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getTech()
            ..getScience()
            ..getSports()
            ..getHealth()
            ..getEntertainment(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..changeMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) => AppCubit(),
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.red,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(
                    color: Colors.red,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Colors.black87,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black87,
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black87,
                  unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.red,
                  type: BottomNavigationBarType.fixed,
                ),
                scaffoldBackgroundColor: Colors.black87,
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                  color: Colors.white,
                )),
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: NewsLayout(),
            );
          }),
    );
  }
}

// baseurl: https://newsapi.org/
// method : v2/top-headlines?
// queries: country=eg&category=business&apiKey=b0aedf2cb0234b89aeed64a5c51699a4
