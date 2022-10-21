import 'package:flutter/material.dart';
import 'package:flutter_news/data/model/category_news_model/category_news_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetCategoryNews extends StatefulWidget {
  final List<CategoryNews> listCategories;
  final int indexDefaultSelected;
  int Function(dynamic index) onTab;

  WidgetCategoryNews({
    Key? key,
    required this.listCategories,
    required this.indexDefaultSelected,
    required this.onTab,
  }) : super(key: key);

  @override
  _WidgetCategoryNewsState createState() => _WidgetCategoryNewsState();
}

class _WidgetCategoryNewsState extends State<WidgetCategoryNews> {
  late int indexCategorySelected;

  @override
  void initState() {
    indexCategorySelected = widget.indexDefaultSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 65.h,
        child: ListView.builder(
          itemCount: widget.listCategories.length,

          // padding: EdgeInsets.symmetric(horizontal: 40.w),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,

          itemBuilder: (context, index) {
            var itemCategory = widget.listCategories[index];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: GestureDetector(
                onTap: () {
                  indexCategorySelected = widget.onTab(index);
                },
                child: Container(
                  width: 120.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      opacity: (indexCategorySelected == index ? 1 : 0.4),
                      // colorFilter:  ColorFilter.mode(
                      //     Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      image: AssetImage(itemCategory.categoryImage.toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: (Text(
                      itemCategory.categoryName,
                      style: TextStyle(
                        color: Colors.white.withOpacity(
                            indexCategorySelected == index ? 1 : 0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
