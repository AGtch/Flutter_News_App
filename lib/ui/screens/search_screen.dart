import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/constants/themes/colors.dart';
import 'package:flutter_news/injection.dart';
import 'package:flutter_news/logic/cubit/search_cubit/search_cubit.dart';
import 'package:flutter_news/ui/widgets/shared_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/articles_news_model/news_articles_model.dart';
import '../widgets/article_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isConnected = true;
  List<NewsArticles> _newsResultSearching = [];
  static bool isSubmitted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    ScreenUtil.init(context);
    _scrollController.addListener(() {});

    return Scaffold(
      body: Column(
        children: [
          searchTextForm(),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: handleInternetWidget(
                buildBlocWidget: searchBlocBuild(), isConnected: isConnected),
          ),
        ],
      ),
    );
  }

  // This function is triggered when the clear button is pressed
  void _clearSearchTextField() {
    // Clear everything in the text field
    _searchTextController.clear();
    // Call setState to update the UI
    setState(() {
      _newsResultSearching.clear();
    });
  }

  Widget searchTextForm() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: _searchTextController,
        onFieldSubmitted: (String value) {
          setState(() {
            BlocProvider.of<SearchCubit>(context)
                .getArticlesFromSearching(searchedNews: value);
            isSubmitted = true;
          });
        },
        maxLines: 1,
        maxLength: 50,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: getIt.get<ColorsApp>().mainColor),
          ),
          hintText: AppLocalizations.of(context)!.search_label,
          hintStyle: Theme.of(context).textTheme.subtitle1,
          suffixIcon: _searchTextController.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: getIt.get<ColorsApp>().clearIconColor,
                  ),
                  onPressed: () {
                    _clearSearchTextField();
                  },
                ),
          prefixIcon: _searchTextController.text.isEmpty
              ? Icon(
                  Icons.search,
                  color: getIt.get<ColorsApp>().mainColor,
                )
              : null,
        ),
        cursorColor: getIt.get<ColorsApp>().mainColor,
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Widget searchBlocBuild() {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FoundArticlesSuccessState) {
          _newsResultSearching = state.articlesResultSearch;
          return ArticlesListWidget(
            newArticles: _newsResultSearching,
            scrollController: _scrollController,
          );
        } else if (state is SearchLoadingState) {
          _newsResultSearching = [];
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.no_result,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }
      },
    );
  }
}
