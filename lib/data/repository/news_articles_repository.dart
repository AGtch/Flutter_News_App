import 'package:flutter_news/data/model/articles_news_model/news_articles_model.dart';
import 'package:flutter_news/data/services/remote_source/api_service.dart';

class NewsArticlesRepository {
  final ApiService apiService;

  NewsArticlesRepository({required this.apiService});

  Future<List<NewsArticles>> getNewsArticlesResponse({
    required String category,
    required String country,
    required int page,
  }) async {
    List<dynamic> newsArticles = await apiService.getNewsArticlesResponse(
      category: category,
      country: country,
      page: page,
    );
    return newsArticles
        .map((article) => NewsArticles.fromJson(json: article))
        .toList();
  }

  Future<List<NewsArticles>> searchForNews({
    required String searchedNews,
  }) async {
    List<dynamic> newsArticles =
        await apiService.searchForNews(searchedNews: searchedNews);
    return newsArticles
        .map((article) => NewsArticles.fromJson(json: article))
        .toList();
  }
}
