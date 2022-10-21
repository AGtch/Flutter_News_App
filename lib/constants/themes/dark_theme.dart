import 'package:flutter/material.dart';

import '../../injection.dart';
import 'colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    hoverColor: getIt.get<ColorsApp>().secondColor,
    splashColor: getIt.get<ColorsApp>().colorBlack,
    splashFactory: InkRipple.splashFactory,
    scaffoldBackgroundColor: getIt.get<ColorsApp>().colorBlack,
    appBarTheme: AppBarTheme(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      elevation: 4,
      centerTitle: true,
      color: getIt.get<ColorsApp>().mainColor,
      titleTextStyle: TextStyle(
        color: getIt.get<ColorsApp>().white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: getIt.get<ColorsApp>().colorBlack,
    //   elevation: 8,
    //   enableFeedback: true,
    //   unselectedItemColor: getIt.get<ColorsApp>().unselectedItemColorDarkMode,
    //   selectedItemColor: getIt.get<ColorsApp>().mainColor,
    //   type: BottomNavigationBarType.fixed,
    // ),

    bottomAppBarColor: getIt.get<ColorsApp>().bottomNaviColorInDark,
    iconTheme: IconThemeData(color: getIt.get<ColorsApp>().unselectedItemColor),
    // useMaterial3: true,
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      color: getIt.get<ColorsApp>().colorBlack,
    ),
    indicatorColor: getIt.get<ColorsApp>().mainColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: getIt.get<ColorsApp>().mainColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: getIt.get<ColorsApp>().mainColor),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: 8, color: getIt.get<ColorsApp>().mainColor),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        color: getIt.get<ColorsApp>().white,
      ),
      headline2: TextStyle(
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
        color: getIt.get<ColorsApp>().white,
      ),
      subtitle1: TextStyle(
        color: getIt.get<ColorsApp>().subtitleInDarkMode,
        overflow: TextOverflow.ellipsis,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        color: getIt.get<ColorsApp>().subtitleInDarkMode,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        color: getIt.get<ColorsApp>().colorBlack,
      ),
    ),
  );
}
