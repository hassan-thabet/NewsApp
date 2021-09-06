import 'package:cairo_daily_news/Bloc/news_feed_tab/news_feed_tab_bloc.dart';
import 'package:cairo_daily_news/Bloc/news_feed_tab/news_feed_tab_state.dart';
import 'package:cairo_daily_news/components/header_headline.dart';
import 'package:cairo_daily_news/components/row_headline.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeed extends StatelessWidget {
  static String id = 'NewsFeedScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsFeedBloc, NewsFeedStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality (
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 8),
                      child: Text(
                        'آخر الاخبار',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 30)
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DefaultTabController(
                              length: NewsFeedBloc.get(context).myTabs.length,
                              initialIndex: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: TabBar(
                                      isScrollable: true,
                                      tabs: NewsFeedBloc.get(context).myTabs,
                                      onTap: (index) {
                                        NewsFeedBloc.get(context)
                                            .tabChange(index);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Builder(builder: (_) {
                                      return Column(
                                        children: [
                                          (NewsFeedBloc.get(context).articles.length > 0)
                                           ? Container(
                                            height: 180,
                                            width: double.infinity,
                                            child: CarouselSlider(
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  enableInfiniteScroll: true,
                                                  autoPlayInterval:
                                                      Duration(seconds: 3),
                                                ),
                                                items: <Widget>[
                                                  headerHeadline(NewsFeedBloc.get(context).articles[0]),
                                                  headerHeadline(NewsFeedBloc.get(context).articles[1]),
                                                  headerHeadline(NewsFeedBloc.get(context).articles[2]),
                                                  headerHeadline(NewsFeedBloc.get(context).articles[3]),

                                                ]),
                                          )
                                           : Center(child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                              strokeWidth: 2,
                                            ),
                                          ),),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFB933F)),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFB933F)),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFB933F)),
                                              ),
                                              Container(
                                                width: 8,
                                                height: 8,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 4.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffFB933F)),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'العناوين الرئيسيه',
                                              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 24)
                                            ),
                                          ),
                                          (NewsFeedBloc.get(context).articles.length > 0)
                                          ? ListView.builder(
                                            physics : NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemBuilder: (context , index) => rowHeadline(context , NewsFeedBloc.get(context).articles[index]),
                                            itemCount: NewsFeedBloc.get(context).articles.length,
                                          )
                                          : Center(child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                              strokeWidth: 2,
                                            ),
                                          ),),
                                        ],
                                      );
                                    }),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
