import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
Widget headerHeadline (article) {
  return Padding(
    padding:
    const EdgeInsets.all(
        8.0),
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${article['urlToImage']}',
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 25.0,
              width: 25.0,
              child: Center(child: Text('Loading'))
            ),
          ),
          errorWidget: (context, url, error) => Image.network(
              'https://via.placeholder.com/600x300?text=No+image+avilable'),
          fit: BoxFit.fitWidth,
          height: 140,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.8),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),

              child: Padding(
                  padding: const EdgeInsets.only(top: 0 , left: 8, right: 6 , bottom: 4),
                  child: Center(
                      child: Text(
                          '${article['title']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 2,
                          )
                      )
                  )
              )),
        ),
      ],
    ),
  );
}
