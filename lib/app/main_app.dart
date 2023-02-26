import 'package:emihr_code/app/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'data/repository/master_repository_impl.dart';
import 'themes/themes/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MasterRepositoryImpl(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: const HomePageScreen(),
        locale: const Locale('en', 'US'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // themeMode: state.themeMode,
        themeMode: ThemeMode.light,
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
      ),
    );
  }
}
