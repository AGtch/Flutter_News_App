import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news/constants/themes/colors.dart';
import 'package:flutter_news/injection.dart';
import 'package:flutter_news/logic/cubit/settings%20cubit/settings_cubit.dart';

import '../../data/services/local_source/shared_preferences_utils.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsCubit settingsCubit;

  const SettingsScreen({Key? key, required this.settingsCubit})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? isDark = getIt.get<SharedPreferencesUtils>().getTheme("dark") ?? false;
  String country =
      getIt.get<SharedPreferencesUtils>().getCountry('country') ?? 'us';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SettingsCubit>(context);
  }

  String selectedCountry =
      getIt.get<SharedPreferencesUtils>().getCountry('country') ?? 'us';
  String selectedLanguage =
      getIt.get<SharedPreferencesUtils>().getLanguage('language') ?? 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dark_mode,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Switch(
                    value: isDark ??= false,
                    activeColor: getIt.get<ColorsApp>().mainColor,
                    inactiveTrackColor: getIt.get<ColorsApp>().gray,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        widget.settingsCubit
                            .changeTheme(isDark: isDark ?? false);
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.country,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  DropdownButton(
                    elevation: 6,
                    dropdownColor: isDark!
                        ? getIt.get<ColorsApp>().dropdownColor
                        : getIt.get<ColorsApp>().white,
                    enableFeedback: true,
                    focusColor: getIt.get<ColorsApp>().mainColor,
                    value: selectedCountry,
                    style: Theme.of(context).textTheme.headline2,
                    items: [
                      DropdownMenuItem(
                        value: 'eg',
                        child: Text(AppLocalizations.of(context)!.egypt),
                      ),
                      DropdownMenuItem(
                        value: 'us',
                        child: Text(AppLocalizations.of(context)!.usa),
                      ),
                      DropdownMenuItem(
                        value: 'de',
                        child: Text(AppLocalizations.of(context)!.germany),
                      )
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedCountry = value!;
                        getIt
                            .get<SharedPreferencesUtils>()
                            .setCountry("country", selectedCountry);
                        widget.settingsCubit
                            .changeCountry(country: selectedCountry);
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  DropdownButton(
                    dropdownColor: isDark!
                        ? getIt.get<ColorsApp>().dropdownColor
                        : getIt.get<ColorsApp>().white,
                    value: selectedLanguage,
                    style: Theme.of(context).textTheme.headline2,
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(AppLocalizations.of(context)!.arabic),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(AppLocalizations.of(context)!.english),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        selectedLanguage = value!;
                        widget.settingsCubit
                            .changeLanguage(language: selectedLanguage);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
