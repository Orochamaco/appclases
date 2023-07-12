import 'package:appclases/presentation/screens/home_screen.dart';
import 'package:appclases/presentation/screens/log.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:appclases/services/voter.dart';
import 'package:appclases/providers/jwt_provider.dart';
import 'package:provider/provider.dart';
//import 'dart:convert';

class AuthorizationScreen extends StatelessWidget {
  final String url;
  final String token;

  const AuthorizationScreen({Key? key, required this.url, required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
      initialUrl: url,
      userAgent: "random",
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controller.clearCache();
        CookieManager().clearCookies();
      },
      navigationDelegate: (delegate) {
        final Uri responseUri = Uri.parse(delegate.url);
        final String path = responseUri.path;
        final bool ok = path.endsWith('/' + token + '/exists');
        if (ok) {
          VoterService.getJwt(token).then((value) => print(value));

          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ok ?  HomeScreen() : const LogScreen()),
          );
        }

        return NavigationDecision.navigate;
      },
    ));
  }
}