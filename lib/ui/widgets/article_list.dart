import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/ui/screens/web_view_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/articles_news_model/news_articles_model.dart';
import 'design_article_item_in_list.dart';

class ArticlesListWidget extends StatefulWidget {
  List<NewsArticles> newArticles;
  ScrollController scrollController;

  ArticlesListWidget(
      {Key? key, required this.newArticles, required this.scrollController})
      : super(key: key);

  @override
  State<ArticlesListWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends State<ArticlesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    ScreenUtil.init(context);
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: widget.newArticles.length + 1,
      shrinkWrap: true,
      dragStartBehavior: DragStartBehavior.start,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemBuilder: ((context, index) {
        if (index < widget.newArticles.length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                        url: widget.newArticles[index].urlToReadNewsInWebSite
                            .toString()),
                  ));
            },
            child: ArticleItemDesignInList(
              newsArticles: widget.newArticles[index],
            ),
          );
        } else {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: CircularProgressIndicator(),
          ));
        }
      }),
    );
  }
}
