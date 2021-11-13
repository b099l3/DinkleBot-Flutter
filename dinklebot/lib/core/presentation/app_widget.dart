import 'package:dartz/dartz.dart';
import 'package:dinklebot/auth/application/auth_notifier.dart';
import 'package:dinklebot/auth/shared/providers.dart';
import 'package:dinklebot/core/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialisationProvider = FutureProvider<Unit>((ref) async {
  final authNotifer = ref.read(authNotifierProvider.notifier);
  await authNotifer.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initialisationProvider, (_, __) {});
    ref.listen<AuthState>(
      authNotifierProvider,
      (_, state) {
        state.maybeMap(
          orElse: () {},
          authenticated: (_) {
            appRouter.pushAndPopUntil(
              const FirstRoute(),
              predicate: (route) => false,
            );
          },
          unauthenticated: (_) {
            appRouter.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          },
        );
      },
    );
    return MaterialApp.router(
      title: 'Dinkle Bot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
