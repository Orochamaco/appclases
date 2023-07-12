import 'dart:developer';
import 'package:appclases/models/curses.dart';
import 'package:appclases/presentation/screens/nota.dart';
import 'package:appclases/presentation/screens/screens.dart';
import 'package:appclases/providers/jwt_provider.dart';
import 'package:appclases/services/services.dart';
import 'package:appclases/services/voter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'dart:core';




class HomeScreen extends StatelessWidget {
  static String routeName = '/';

  Future<String?> getSavedJwt() async {
    return await VoterService.getSavedJwt();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getSavedJwt(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          print('Error al cargar los datos: ${snapshot.error}');
          return Scaffold(
            body: Center(child: Text('Error al cargar los datos')),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          
          String jwt = snapshot.data!;
          print('JWT: $jwt');
          return Scaffold(
            drawer: MenuApp(),
            appBar: AppBar(
              title: const Text('Lista de cursos'),
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
            body: FutureBuilder(
              future: CoursesService().coursesData(jwt),
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
                        onTap: () => Navigator.pushNamed(
                          context,
                          VoteScreen.routeName,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  );
                }
              },
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text('No hay cursos disponibles')),
          );
        }
      },
    );
  }
}
