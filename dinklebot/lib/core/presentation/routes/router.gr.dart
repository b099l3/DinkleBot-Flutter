// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../auth/presentation/authorisation_page.dart' as _i3;
import '../../../auth/presentation/sign_in_page.dart' as _i2;
import '../../../first/first_page.dart' as _i4;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    AuthorisationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorisationRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.AuthorisationPage(
              key: args.key,
              authorisationUrl: args.authorisationUrl,
              onAuthorisationCodeRedirectAttempt:
                  args.onAuthorisationCodeRedirectAttempt));
    },
    FirstRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FirstPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i5.RouteConfig(AuthorisationRoute.name, path: '/auth'),
        _i5.RouteConfig(FirstRoute.name, path: '/first')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for [_i3.AuthorisationPage]
class AuthorisationRoute extends _i5.PageRouteInfo<AuthorisationRouteArgs> {
  AuthorisationRoute(
      {_i6.Key? key,
      required Uri authorisationUrl,
      required void Function(Uri) onAuthorisationCodeRedirectAttempt})
      : super(name,
            path: '/auth',
            args: AuthorisationRouteArgs(
                key: key,
                authorisationUrl: authorisationUrl,
                onAuthorisationCodeRedirectAttempt:
                    onAuthorisationCodeRedirectAttempt));

  static const String name = 'AuthorisationRoute';
}

class AuthorisationRouteArgs {
  const AuthorisationRouteArgs(
      {this.key,
      required this.authorisationUrl,
      required this.onAuthorisationCodeRedirectAttempt});

  final _i6.Key? key;

  final Uri authorisationUrl;

  final void Function(Uri) onAuthorisationCodeRedirectAttempt;
}

/// generated route for [_i4.FirstPage]
class FirstRoute extends _i5.PageRouteInfo<void> {
  const FirstRoute() : super(name, path: '/first');

  static const String name = 'FirstRoute';
}
