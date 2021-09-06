import 'package:bloc/bloc.dart';
import 'package:cairo_daily_news/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_feed_tab_state.dart';

class NewsFeedBloc extends Cubit<NewsFeedStates>
{
  NewsFeedBloc() : super (NewsFeedInitialState());
  static NewsFeedBloc get(context) => BlocProvider.of(context);

  List <dynamic> articles = [];
  String? category = 'general';
  List<Tab> myTabs = <Tab>[
    Tab(text: 'عام',),
    Tab(text: 'الترفيه'),
    Tab(text: 'مال و اعمال'),
    Tab(text: 'الصحه'),
    Tab(text: 'العلوم'),
    Tab(text: 'الرياضه'),
    Tab(text: 'التكنولوجيا'),
  ];


  Future<dynamic> getArticles() async
  {
    emit((NewsFeedLoadingState()));
    await DioHelper.getData(
        path: 'v2/top-headlines',
        query:  {
          'country' : 'eg',
          'category' : category,
          'apiKey' : '6beba6812a584f12932c4f473eaac5ed'
        }
    ).then((value) {
      print(value.data['totalResults']);
      articles = value.data['articles'];
      print('data was arrive from ${category!}');
      emit((NewsFeedSuccessState()));
      return articles[0]['title'];
    }).catchError((error) {
      emit((NewsFeedOnErrorState()));
      return error.toString();
    });
    return articles;
  }

  void tabChange(index)
  {
    switch(index)
    {
      case 0 :
        category = 'general';
        break;
      case 1 :
        category = 'entertainment';
        break;
      case 2 :
        category = 'business';
        break;
      case 3 :
        category = 'health';
        break;
      case 4 :
        category = 'science';
        break;
      case 5 :
        category = 'sports';
        break;
      case 6 :
        category = 'technology';
        break;
    }
    emit((NewsFeedTabChangeState()));
    getArticles();

  }

}