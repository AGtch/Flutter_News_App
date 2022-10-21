import 'package:json_annotation/json_annotation.dart';

part 'category_news_model.g.dart';

@JsonSerializable()
class CategoryNews {
  late String categoryName;
  late String categoryImage;

  CategoryNews({required this.categoryName, required this.categoryImage});

  factory CategoryNews.fromJson(Map<String, dynamic> json) =>
      _$CategoryNewsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryNewsToJson(this);
}
