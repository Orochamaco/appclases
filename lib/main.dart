import 'package:appclases/presentation/app.dart';
import 'package:appclases/providers/jwt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//void main() {
//  runApp(const MyApp());
//}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => JwtProvider(),
      child: const MyApp(),
      ),
    );
}