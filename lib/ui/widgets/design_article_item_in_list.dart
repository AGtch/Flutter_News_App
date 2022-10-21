import 'package:flutter/material.dart';
import 'package:flutter_news/data/model/articles_news_model/news_articles_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/themes/colors.dart';
import '../../injection.dart';

class ArticleItemDesignInList extends StatefulWidget {
  late NewsArticles newsArticles;

  ArticleItemDesignInList({Key? key, required this.newsArticles})
      : super(key: key);

  @override
  State<ArticleItemDesignInList> createState() =>
      _ArticleItemDesignInListState();
}

class _ArticleItemDesignInListState extends State<ArticleItemDesignInList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(36)),
        height: 145.w,
        width: size.width,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              articleImage(),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: size.width,
                      child: Text(
                          maxLines: 2,
                          widget.newsArticles.title ?? 'No Title',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: size.width,
                        child: Text(
                          widget.newsArticles.description ?? 'No description',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            widget.newsArticles.source!['name'] ??
                                'No source Name',
                            maxLines: 1,
                            style: TextStyle(
                              color: getIt.get<ColorsApp>().mainColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(
                              color: getIt.get<ColorsApp>().gray,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          durationTime(),
                          style: TextStyle(
                            color: getIt.get<ColorsApp>().gray,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String durationTime() {
    int duration = DateTime.now()
        .difference(DateTime.parse(widget.newsArticles.publishTime!))
        .inHours;
    if (duration > 24) {
      return 'since ${(duration / 24).round()} days';
    } else {
      return 'since $duration hr';
    }
  }

  Widget articleImage() {
    return (widget.newsArticles.newsImageUrl != null)
        ? SizedBox(
            height: 120.h,
            width: 150.w,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: widget.newsArticles.newsImageUrl!,
              fit: BoxFit.fill,
              fadeInCurve: Curves.easeInExpo,
              fadeInDuration: const Duration(milliseconds: 700),
            ),
          )
        : Container(
            height: 120.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img_not_found.jpg'),
              ),
            ),
          );
  }
}
