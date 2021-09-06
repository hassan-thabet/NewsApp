import 'package:cairo_daily_news/Bloc/home_screen/home_screen_bloc.dart';
import 'package:cairo_daily_news/Bloc/news_feed_tab/news_feed_tab_bloc.dart';
import 'package:cairo_daily_news/constants/MyBlocObserver.dart';
import 'package:cairo_daily_news/network/dio_helper.dart';
import 'package:cairo_daily_news/screens/home_screen.dart';
import 'package:cairo_daily_news/screens/tabs/news_feed.dart';
import 'package:cairo_daily_news/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[200],
    statusBarIconBrightness : Brightness.dark,
  ));

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsFeedBloc()..getArticles()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          scaffoldBackgroundColor: Colors.grey[200],
          fontFamily: 'Cairo',
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xffFB933F),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[200],
            titleTextStyle: TextStyle(color: Colors.black87),
            iconTheme: IconThemeData(color: Colors.black87),
          ),
          indicatorColor: Color(0xffFB933F),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.grey[200],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffFB933F),
            unselectedItemColor: Colors.black54,
            elevation: 4,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Color(0xffFB933F),
            unselectedLabelColor: Colors.black,
          ),
          textTheme: TextTheme(
            caption: TextStyle(
              color: Colors.black87,
            ),
            headline6: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: SplashScreen(),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          NewsFeed.id: (context) => NewsFeed(),
          HomeScreen.id: (context) => HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
