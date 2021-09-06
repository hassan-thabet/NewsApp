import 'package:cairo_daily_news/Bloc/home_screen/home_screen_bloc.dart';
import 'package:cairo_daily_news/Bloc/home_screen/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeBloc , HomeStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        return Scaffold(
          body: HomeBloc.get(context).screens.elementAt(HomeBloc.get(context).currentTab),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: HomeBloc.get(context).currentTab,
            onTap: (index) {
              HomeBloc.get(context).onTabChange(index);
            },
            selectedLabelStyle: TextStyle(
              fontFamily: 'Quicksand',
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Quicksand',
            ),
            elevation: 4,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                //label: 'الاعدادات',
                label: 'q',
                icon: Icon(Icons.settings_outlined),

              ),
              BottomNavigationBarItem(
                //label: 'محفوظات',
                label: 'q',
                icon: Icon(Icons.bookmark_border_rounded),
              ),
              BottomNavigationBarItem(
                label: 'q',
                // label: 'البحث',
                icon: Icon(Icons.search_rounded),
              ),
              BottomNavigationBarItem(
                label: 'q',
                // label: 'آخر الاخبار',
                icon: Icon(Icons.explore_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
