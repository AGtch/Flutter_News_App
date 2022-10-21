import 'package:flutter/material.dart';
import 'package:flutter_news/ui/widgets/article_list.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../data/model/articles_news_model/news_articles_model.dart';
import '../../data/model/category_news_model/category_news_model.dart';

Widget noInternetWidget() {
  return Center(child: Image.asset("assets/images/no_internet.png"));
}

List<CategoryNews> newsCategories = [
  CategoryNews(
      categoryImage: 'assets/images/img_business.png',
      categoryName: 'Business'),
  CategoryNews(
      categoryImage: 'assets/images/img_entertainment.png',
      categoryName: 'Entertainment'),
  CategoryNews(
      categoryImage: 'assets/images/img_health.png', categoryName: 'Health'),
  CategoryNews(
      categoryImage: 'assets/images/img_science.png', categoryName: 'Science'),
  CategoryNews(
      categoryImage: 'assets/images/img_sport.png', categoryName: 'Sports'),
  CategoryNews(
      categoryImage: 'assets/images/img_technology.png',
      categoryName: 'Technology'),
];

Widget createListView(
    {required List<NewsArticles> newsArticles,
    required ScrollController scrollController}) {
  return ArticlesListWidget(
    newArticles: newsArticles,
    scrollController: scrollController,
  );
}

Widget handleInternetWidget(
    {required bool isConnected, required Widget buildBlocWidget}) {
  return OfflineBuilder(
    connectivityBuilder: (context, connectivity, child) {
      isConnected = connectivity != ConnectivityResult.none;
      if (isConnected) {
        return buildBlocWidget;
      } else {
        return noInternetWidget();
      }
    },
    child: Container(),
  );
}
