import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:vas_app/core/theme/theme_notifier.dart';
import 'package:vas_app/feature/app/app_adaptive_provider.dart';
import 'package:vas_app/feature/app/bloc_providers.dart';
import 'package:vas_app/feature/app/routing/app_router_provider.dart';
import 'package:vas_app/feature/app/routing/path_files.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _router = RoutesInit();
  late GetIt locator;

  @override
  void initState() {
    locator = GetIt.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppAdaptiveProvider(
      child: AppRouterProvider(
        goRouter: _router.router,
        child: ChangeNotifierProvider<ThemeNotifier>( // Добавляем ChangeNotifierProvider
          create: (_) => ThemeNotifier(),
          child: Consumer<ThemeNotifier>( // Используем Consumer для отслеживания изменений
            builder: (context, themeNotifier, child) {
              return buildApp(context, themeNotifier);
            },
          ),
        ),
      ),
    );
  }

  buildApp(BuildContext context, ThemeNotifier themeNotifier) {
    return MultiBlocProvider(
      providers: buildListProviders(locator: locator),
      child: MaterialApp.router(
        // theme: ThemeData.light(), // Укажите вашу светлую тему
        darkTheme: ThemeData.dark(), // Укажите вашу темную тему
        // themeMode: themeNotifier.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        // Слушаем тему
        theme: themeNotifier.currentTheme,  // Используем текущую тему из ThemeNotifier
        builder: BotToastInit(),
        title: 'VAS documents',
        routerConfig: _router.router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
      ),
    );
  }
}
