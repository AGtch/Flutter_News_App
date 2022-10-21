import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants/themes/dark_theme.dart';
import '../constants/themes/light_theme.dart';
import '../data/services/local_source/shared_preferences_utils.dart';
import '../injection.dart';
import '../logic/cubit/MyBlocObserver.dart';
import '../logic/cubit/navigation_cubit/bottom_navigation_cubit.dart';
import '../logic/cubit/settings cubit/settings_cubit.dart';
import 'home_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupLocator();
  Bloc.observer = MyBlocObserver();
  runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    isDark = getIt.get<SharedPreferencesUtils>().getTheme("dark") ?? false;
    language =
        getIt.get<SharedPreferencesUtils>().getLanguage('language') ?? 'en';
  }

  bool isDark = false;
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => GetIt.instance<NavigationCubit>(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => GetIt.instance<SettingsCubit>(),
        ),
      ],
      child: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is ChangeThemeState) {
          print('ChangeThemeState $isDark');
          isDark = state.isDark;
        }
        if (state is ChangeLanguageState) {
          language = state.language;
        }
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: (language == 'en')
              ? AppLocalizations.supportedLocales[1]
              : AppLocalizations.supportedLocales.first,
          darkTheme: darkTheme(),
          theme: lightTheme(),
          debugShowCheckedModeBanner: false,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage(),
        );
      }),
    );
  }
}
