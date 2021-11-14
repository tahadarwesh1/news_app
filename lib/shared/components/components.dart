import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget buildArticle(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${article['urlToImage'] ?? 'https://uae.microless.com/cdn/no_image.jpg'}',
                  ),
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articleListBuilder(list) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticle(list[index], context),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ),
      itemCount: list.length,
    );

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}
