import 'dart:developer';
import 'package:appclases/models/curses.dart';
import 'package:appclases/presentation/screens/nota.dart';
import 'package:appclases/presentation/screens/screens.dart';
import 'package:appclases/providers/jwt_provider.dart';
import 'package:appclases/services/services.dart';
import 'package:appclases/services/voter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CoursesService coursesService = CoursesService();

  @override
  Widget build(BuildContext context) {
    final jwtProvider = Provider.of<JwtProvider>(context, listen: false);

    return Scaffold(
      drawer: MenuApp(),
      appBar: AppBar(
        title: const Text('Lista de cursos'),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: FutureBuilder(
        future: coursesService.coursesData(jwtProvider.jwt),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColorDark,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay cursos disponibles'));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final course = snapshot.data![index];
                return ListTile(
                  title: Text(course.name),
                  subtitle: Text(course.code),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () => Navigator.pushNamed(context, VoteScreen.routeName),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        },
      ),
    );
  }
}