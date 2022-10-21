import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/injection.dart';
import 'package:flutter_news/logic/cubit/search_cubit/search_cubit.dart';
import 'package:flutter_news/logic/cubit/settings%20cubit/settings_cubit.dart';
import 'package:flutter_news/ui/screens/news_screen.dart';
import 'package:flutter_news/ui/screens/search_screen.dart';
import 'package:flutter_news/ui/screens/settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/themes/colors.dart';
import '../logic/cubit/data_cubit/articles_cubit.dart';
import '../logic/cubit/navigation_cubit/bottom_navigation_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NavigationCubit>(context);
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    ScreenUtil.init(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Center(
            child: Text(AppLocalizations.of(context)!.app_name),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          child: GNav(
            hoverColor: getIt.get<ColorsApp>().secondColor,
            haptic: true,
            tabBackgroundColor:
                getIt.get<ColorsApp>().mainColor.withOpacity(0.9),
            tabBorderRadius: 16,
            gap: 4,
            color: getIt.get<ColorsApp>().gray,
            iconSize: 24,
            curve: Curves.slowMiddle,
            // tab animation curves

            textStyle: Theme.of(context).textTheme.labelMedium,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
            duration: const Duration(milliseconds: 900),
            activeColor: getIt.get<ColorsApp>().colorBlack,

            tabs: [
              GButton(
                icon: Icons.newspaper,
                text: AppLocalizations.of(context)!.news_label,
                //  iconColor: Colors.grey,
                // iconActiveColor: Colors.black,
              ),
              GButton(
                icon: Icons.search,
                text: AppLocalizations.of(context)!.search_label,
                // iconColor:getIt.get<ColorsApp>().textGray,
              ),
              GButton(
                icon: Icons.settings,
                text: AppLocalizations.of(context)!.settings_label,
                // iconColor: Colors.grey,
                // iconActiveColor: Colors.black,
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              setState(() {
                if (index == 0) {
                  getIt.get<NavigationCubit>().getNavBarItem(NavbarItem.news);
                } else if (index == 1) {
                  getIt.get<NavigationCubit>().getNavBarItem(NavbarItem.search);
                } else if (index == 2) {
                  getIt
                      .get<NavigationCubit>()
                      .getNavBarItem(NavbarItem.settings);
                }
                currentIndex = index;
              });
            },
          ),
        ),
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.navbarItem == NavbarItem.news) {
            final ArticlesCubit articlesCubit = GetIt.instance<ArticlesCubit>();

            return BlocProvider(
              create: (context) => articlesCubit,
              child: NewsScreen(
                cubit: articlesCubit,
              ),
            );
          } else if (state.navbarItem == NavbarItem.search) {
            return BlocProvider(
              create: (context) => GetIt.instance<SearchCubit>(),
              child: const SearchScreen(),
            );
          } else if (state.navbarItem == NavbarItem.settings) {
            return SettingsScreen(
              settingsCubit: getIt.get<SettingsCubit>(),
            );
          }
          return const Center(
            child: Text('Error!! please send me the error to help !'),
          );
        }));
  }
}

//
// List<Widget> screensWithBloc = [
//   BlocProvider(
//     create: (context) => articlesCubit,
//     child: NewsScreen(
//       cubit: articlesCubit,
//     ),
//   ),
//   BlocProvider(
//     create: (context) => getIt.get<SearchCubit>(),
//     child: SearchScreen(),
//   ),
//   SettingsScreen(
//     settingsCubit: getIt.get<SettingsCubit>(),
//   ),
// ];
