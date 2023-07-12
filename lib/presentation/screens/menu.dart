import 'package:appclases/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  static String routeName = 'menu';
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Integrantes'),
            onTap: () => Navigator.pushNamed(context, IntegrantScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('resultados'),
            onTap: () => Navigator.pushNamed(context, ResultScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('LogOut'),
            onTap: () => Navigator.pushNamed(context, VoteScreen.routeName),
        
          ),
        ],
        
      ),
    );
  }
}