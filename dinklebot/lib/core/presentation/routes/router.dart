import 'package:auto_route/annotations.dart';
import 'package:dinklebot/auth/presentation/authorisation_page.dart';
import 'package:dinklebot/auth/presentation/sign_in_page.dart';
import 'package:dinklebot/first/first_page.dart';
import 'package:dinklebot/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in'),
    MaterialRoute(page: AuthorisationPage, path: '/auth'),
    MaterialRoute(page: FirstPage, path: '/first'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
