import 'package:json_annotation/json_annotation.dart';

part 'news_articles_model.g.dart';

@JsonSerializable()
class NewsArticles {
  late Map<String, dynamic>? source;

  late String? author;

  late String? title;

  late String? description;
  @JsonKey(name: 'urlToImage')
  late String? newsImageUrl;
  @JsonKey(name: 'url')
  late String? urlToReadNewsInWebSite;
  @JsonKey(name: 'publishedAt')
  late String? publishTime;
  @JsonKey(name: 'content')
  late String? contentOfNews;

  NewsArticles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.newsImageUrl,
    required this.urlToReadNewsInWebSite,
    required this.publishTime,
    required this.contentOfNews,
  });

  factory NewsArticles.fromJson({required Map<String, dynamic> json}) {
    return _$NewsArticlesFromJson(json);
  }
}
