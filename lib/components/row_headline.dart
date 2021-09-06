import 'package:cairo_daily_news/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget rowHeadline(context , article) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: '${article['urlToImage']}',
            placeholder: (context, url) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                  strokeWidth: 2,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.network(
                'https://via.placeholder.com/150x150?text=No+image+avilable'),
            height: 130,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  '${article['title']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    (article['author'] != null)
                        ? 'مصدر الخبر : ${article['author']}'
                        : 'مصدر الخبر : ${article['source']['name']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'تاريخ النشر : ${article['publishedAt']} ',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => WebViewScreen(article['url'] , article['title'])),);
                        print('${article['url']}');
                      },
                      child: Text('مشاهدة المزيد')),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
