part of 'articles_cubit.dart';

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoadingState extends ArticlesState {
  final List<NewsArticles> oldArticles;

  final bool isFirstFetch;

  ArticlesLoadingState({required this.oldArticles, this.isFirstFetch = false});
}

class LoadedArticlesSuccess extends ArticlesState {
  final List<NewsArticles> newsArticles;

  LoadedArticlesSuccess({required this.newsArticles});
}

// class LoadMoreArticles extends ArticlesState {
//   final List<NewsArticles> extraArticles;
//
//   LoadMoreArticles(this.extraArticles);
// }
//
class ChangeCategoryOfArticlesState extends ArticlesState {
  final int categoryIndex;

  ChangeCategoryOfArticlesState({required this.categoryIndex});
}

// class SearchingForArticlesState extends ArticlesState {
//   List<NewsArticles> searchedArticles;
//
//   SearchingForArticlesState({required this.searchedArticles});
// }
