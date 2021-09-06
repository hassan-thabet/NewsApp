import 'package:flutter/material.dart';
class Bookmarks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 8),
                child: Center(
                  child: Text(
                    'قائمة المحفوظات',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icons/bookmarks.png',
                        scale: 3,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                        'ليس لديك اي مقالات محفوظه حتي الان ',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
