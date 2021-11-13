import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dinklebot/auth/shared/providers.dart';
import 'package:dinklebot/core/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    MdiIcons.steam,
                    size: 150,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to\nDinkleBot',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authNotifierProvider.notifier)
                          .signIn((authorisationUrl) {
                        final completer = Completer<Uri>();
                        AutoRouter.of(context).push(
                          AuthorisationRoute(
                            authorisationUrl: authorisationUrl,
                            onAuthorisationCodeRedirectAttempt:
                                (redirectedUrl) {
                              completer.complete(redirectedUrl);
                            },
                          ),
                        );
                        return completer.future;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text('Sign in'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
