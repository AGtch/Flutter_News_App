import 'package:flutter/material.dart';

import '../../injection.dart';
import 'colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: getIt.get<ColorsApp>().white,
    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      elevation: 4,
      centerTitle: true,
      color: getIt.get<ColorsApp>().white,
      titleTextStyle: TextStyle(
        color: getIt.get<ColorsApp>().mainColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: getIt.get<ColorsApp>().white,
    //   elevation: 8,
    //   enableFeedback: true,
    //   selectedItemColor: getIt.get<ColorsApp>().mainColor,
    //   unselectedItemColor: getIt.get<ColorsApp>().unselectedItemColorLightMode,
    //   type: BottomNavigationBarType.fixed,
    // ),
    bottomAppBarColor: getIt.get<ColorsApp>().bottomNaviColorInLight,
    bottomAppBarTheme: BottomAppBarTheme(
      color: getIt.get<ColorsApp>().bottomNaviColorInLight,
      elevation: 16,
      // shape: const CircularNotchedRectangle(),
    ),

    iconTheme: IconThemeData(color: getIt.get<ColorsApp>().unselectedItemColor),
    // ,
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(8),
      // surfaceTintColor: getIt.get<ColorsApp>().white,
      elevation: 6,
      color: getIt.get<ColorsApp>().white,
    ),
    indicatorColor: getIt.get<ColorsApp>().mainColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: getIt.get<ColorsApp>().mainColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: getIt.get<ColorsApp>().mainColor),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: 10, color: getIt.get<ColorsApp>().mainColor),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: getIt.get<ColorsApp>().colorBlack,
        overflow: TextOverflow.ellipsis,
      ),
      headline2: TextStyle(
        fontSize: 12,
        color: getIt.get<ColorsApp>().colorBlack,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle1: TextStyle(
        color: getIt.get<ColorsApp>().subtitleInLightMode,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle2: TextStyle(
        color: getIt.get<ColorsApp>().subtitleInLightMode,
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
