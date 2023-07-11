import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static String routeName = 'resultados';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}