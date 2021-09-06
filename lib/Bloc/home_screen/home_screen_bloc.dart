import 'package:cairo_daily_news/Bloc/home_screen/home_screen_states.dart';
import 'package:cairo_daily_news/screens/tabs/bookmarks.dart';
import 'package:cairo_daily_news/screens/tabs/news_feed.dart';
import 'package:cairo_daily_news/screens/tabs/search.dart';
import 'package:cairo_daily_news/screens/tabs/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeStates>
{
  HomeBloc() : super (HomeInitialState());
  static HomeBloc get (context) => BlocProvider.of(context);

  final List<Widget> screens = [
    Settings(),
    Bookmarks(),
    Search(),
    NewsFeed(),


  ];

  int currentTab = 3;

  void onTabChange(index)
  {
    currentTab = index;
    emit((HomeChangeTabState()));
  }

}