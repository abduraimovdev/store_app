import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/src/data/models/product.dart';
import 'package:store_app/src/data/source/local_source.dart';
import 'package:store_app/src/injector_container.dart';
import 'package:store_app/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_app/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:store_app/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:store_app/src/presentation/bloc/cart/cart_bloc.dart';
import 'package:store_app/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:store_app/src/presentation/bloc/main/main_bloc.dart';
import 'package:store_app/src/presentation/bloc/products/product_bloc.dart';
import 'package:store_app/src/presentation/bloc/splash/splash_bloc.dart';
import 'package:store_app/src/presentation/pages/auth/auth_page.dart';
import 'package:store_app/src/presentation/pages/auth/confirm/confirm_code_page.dart';
import 'package:store_app/src/presentation/pages/auth/register/register_page.dart';
import 'package:store_app/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:store_app/src/presentation/pages/main/detail/detail_screen.dart';
import 'package:store_app/src/presentation/pages/main/main_page.dart';
import 'package:store_app/src/presentation/pages/main/profile/about_us/about_us_page.dart';
import 'package:store_app/src/presentation/pages/main/profile/settings/settings_page.dart';
import 'package:store_app/src/presentation/pages/splash/splash_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<SplashBloc>(),
        child: const SplashPage(),
      ),
    ),

    /// main
    GoRoute(
      name: Routes.main,
      path: Routes.main,
      pageBuilder: (_, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 1200),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
            BlocProvider<HomeBloc>(create: (_) => sl<HomeBloc>()),
          ],
          child: const MainPage(),
        ),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: Routes.detail,
          name: Routes.detail,
          builder: (context, state) => DetailScreen(
            productModel: state.extra! as ProductModel,
          ),
        )
      ],
    ),

    /// profile
    GoRoute(
      path: Routes.aboutUs,
      name: Routes.aboutUs,
      builder: (_, __) => const AboutUsPage(),
    ),
    GoRoute(
      path: Routes.settings,
      name: Routes.settings,
      builder: (_, __) => const SettingsPage(),
    ),

    /// internet connection
    GoRoute(
      path: Routes.internetConnection,
      name: Routes.internetConnection,
      builder: (_, __) => const InternetConnectionPage(),
    ),

    /// auth
    GoRoute(
      path: Routes.auth,
      name: Routes.auth,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: const AuthPage(),
      ),
    ),
    GoRoute(
      path: Routes.confirmCode,
      name: Routes.confirmCode,
      builder: (_, state) => BlocProvider(
        create: (_) => sl<ConfirmCodeBloc>(),
        child: ConfirmCodePage(state: state.extra! as AuthSuccessState),
      ),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      builder: (_, __) => BlocProvider(
        create: (_) => sl<RegisterBloc>(),
        child: const RegisterPage(),
      ),
    ),
  ],
);

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
