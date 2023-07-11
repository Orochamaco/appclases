import 'package:flutter/material.dart';

class IntegrantScreen extends StatelessWidget {
  static String routeName = 'integrantes';
  const IntegrantScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Integrantes'),
        backgroundColor: Theme.of(context).primaryColorDark,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              alignment: Alignment.center,
              child: Icon(Icons.person_outline_rounded, size: 50.0,),
            ),
            ListTile(
              title: Text('Nombre integrante'),
              subtitle: Text('Correo'),
            ),
          ],
      
        ),
      );
  }
}