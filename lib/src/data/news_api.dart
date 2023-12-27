import 'dart:math';

import 'package:dio/dio.dart';
import 'package:footbal_app/src/entity/news.dart';
import 'package:html/parser.dart';
import 'package:xml/xml.dart';

class NewsApi {
  static Future<List<News>> getNews(int leagueId) async {
    List<News> newsList = [];

    var response =
        await Dio().get("https://api.theathletic.com/football/?rss=1");

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.data);
      final rootElement = document.rootElement;
      final entries = rootElement.findElements('entry', namespace: '*');

      for (var entry in entries) {
        final title =
            entry.findElements('title', namespace: '*').first.innerText;
        final summary = entry
            .findElements('summary', namespace: '*')
            .firstOrNull
            ?.innerText;
        final content = entry
            .findElements('content', namespace: '*')
            .firstOrNull
            ?.innerText;
        final imageUrl = entry
            .findElements('link', namespace: '*')
            .toList()[1]
            .getAttribute('href');
        final detailedPostUrl =
            entry.findElements('id', namespace: '*').firstOrNull?.innerText;
        final dateTime =
            entry.findElements('published', namespace: '*').first.innerText;

        final News news = News(
          title: title,
          description: summary ?? content!,
          image: imageUrl!,
          detailUrl: detailedPostUrl!,
          dateTime: dateTime,
        );
        newsList.add(news);
      }

      newsList.shuffle();

      final rand = Random();
      final count = rand.nextInt(8);

      final subNews = newsList.sublist(count * 10, count * 10 + 12);
      return subNews;
    } else {
      throw Exception(response.statusCode);
    }
  }

  static Future<List<String>> getPostContentHtml(
      {required String postUrl}) async {
    var response = await Dio().get(postUrl);

    if (response.statusCode == 200) {
      final document = parse(response.data);
      final element = document.querySelector("div.article-content-container");
      if (element != null) {
        final p =
            element.getElementsByTagName('div.article-content-container > p');
        final pList = <String>[];

        for (var ps in p) {
          pList.add(ps.text);
        }

        return pList;
      }
    }
    throw Exception(response.statusCode);
  }
}
