part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class FoundArticlesSuccessState extends SearchState {
  List<NewsArticles> articlesResultSearch;

  FoundArticlesSuccessState({required this.articlesResultSearch});
}

class NotFoundArticlesState extends SearchState {}
