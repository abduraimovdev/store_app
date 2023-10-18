import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_options.dart';
import 'config/router/app_routes.dart';
import 'core/extension/extension.dart';
import 'core/l10n/app_localizations.dart';
import 'injector_container.dart';
import 'presentation/bloc/cart/cart_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<CartBloc>(),
        child: MaterialApp.router(
          /// title
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,

          /// theme style
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,

          /// lang
          locale: AppOptions.of(context).locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          /// pages
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        ),
      );
}
