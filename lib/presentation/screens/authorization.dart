import 'package:appclases/presentation/screens/home_screen.dart';
import 'package:appclases/presentation/screens/log.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:appclases/services/voter.dart';
import 'package:appclases/providers/jwt_provider.dart';
import 'package:provider/provider.dart';
//import 'dart:convert';

class AuthorizationScreen extends StatelessWidget {
  static String routeName = 'authorization';
  final String url;
  final String token;
  final JwtProvider jwtProvider;
  

  const AuthorizationScreen({Key? key, required this.url, required this.token, required this.jwtProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     final jwtProvider = Provider.of<JwtProvider>(context, listen: false);
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
            VoterService.getJwt(token).then((jwt) {
              jwtProvider.setJwt(jwt);
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ok ? const HomeScreen() : const LogScreen(),
                ),
              );
            });
          }

          return NavigationDecision.navigate;
        },
    ));
  }
}