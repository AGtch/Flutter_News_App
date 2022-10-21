// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticles _$NewsArticlesFromJson(Map<String, dynamic> json) => NewsArticles(
      source: json['source'] as Map<String, dynamic>?,
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      newsImageUrl: json['urlToImage'] as String?,
      urlToReadNewsInWebSite: json['url'] as String?,
      publishTime: json['publishedAt'] as String?,
      contentOfNews: json['content'] as String?,
    );

Map<String, dynamic> _$NewsArticlesToJson(NewsArticles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.newsImageUrl,
      'url': instance.urlToReadNewsInWebSite,
      'publishedAt': instance.publishTime,
      'content': instance.contentOfNews,
    };
