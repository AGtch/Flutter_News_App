import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/articles_news_model/news_articles_model.dart';
import '../../../data/repository/news_articles_repository.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final NewsArticlesRepository newsArticlesRepository;

  ArticlesCubit({required this.newsArticlesRepository})
      : super(ArticlesInitial());

  dynamic indexCategorySelected = 0;
  static int page = 1;
  List<NewsArticles> oldNewsArticles = [];

  void getNewsArticles({
    required String category,
    required String country,
  }) {
    final currentState = state;
    if (currentState is LoadedArticlesSuccess && page != 1) {
      oldNewsArticles = currentState.newsArticles;
    }
    if (page == 1) {
      oldNewsArticles = [];
      emit(ArticlesLoadingState(
          oldArticles: oldNewsArticles, isFirstFetch: true));
    }
    newsArticlesRepository
        .getNewsArticlesResponse(
      category: category.toLowerCase(),
      country: country,
      page: page,
    )
        .then((articlesResponse) {
      emit(ArticlesLoadingState(
          oldArticles: oldNewsArticles, isFirstFetch: page == 1));
      page++;
      List<NewsArticles> articles = (state as ArticlesLoadingState).oldArticles;
      if (articles.isEmpty) {
        articles = articlesResponse;
      } else {
        articles.addAll(articlesResponse);
      }
      emit(LoadedArticlesSuccess(newsArticles: articles));
    });
  }
}
