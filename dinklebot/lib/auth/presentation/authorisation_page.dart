import 'dart:io';

import 'package:dinklebot/auth/infrastructure/bungie_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorisationPage extends StatefulWidget {
  final Uri authorisationUrl;
  final void Function(Uri redirectUrl) onAuthorisationCodeRedirectAttempt;

  const AuthorisationPage({
    Key? key,
    required this.authorisationUrl,
    required this.onAuthorisationCodeRedirectAttempt,
  }) : super(key: key);

  @override
  _AuthorisationPageState createState() => _AuthorisationPageState();
}

class _AuthorisationPageState extends State<AuthorisationPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition. see here https://github.com/flutter/plugins/tree/master/packages/webview_flutter/webview_flutter#using-hybrid-composition
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.authorisationUrl.toString(),
          onWebViewCreated: (controller) {
            controller.clearCache();
            CookieManager().clearCookies();
          },
          navigationDelegate: (navReq) {
            if (navReq.url
                .startsWith(BungieAuthenticator.redirectUrl.toString())) {
              widget.onAuthorisationCodeRedirectAttempt(Uri.parse(navReq.url));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
