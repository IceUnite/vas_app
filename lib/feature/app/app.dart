
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:vas_app/feature/app/app_adaptive_provider.dart';
import 'package:vas_app/feature/app/bloc_providers.dart';
import 'package:vas_app/feature/app/routing/app_router_provider.dart';
import 'package:vas_app/feature/app/routing/path_files.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // late GetIt locator;

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
        child: buildApp(context),
      ),
    );
  }

   buildApp(BuildContext context) {
    return MultiBlocProvider(
      providers: buildListProviders(locator: locator),
      child: MaterialApp.router(
        builder: BotToastInit(),
        title: 'VAS documents',
        // theme: materialAppTheme,
        routerConfig: _router.router,
        localizationsDelegates: const [
          // Locales.delegate,
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
