import 'dart:developer';
import 'package:appclases/models/curses.dart';
import 'package:appclases/presentation/screens/nota.dart';
import 'package:appclases/presentation/screens/screens.dart';
import 'package:appclases/services/services.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String  prueba = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjkzNDFkZWRlZWUyZDE4NjliNjU3ZmE5MzAzMDAwODJmZTI2YjNkOTIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIzODQxMTg2MDU2NjAtdjdhdWo3dTNvMmRnYW4wZXZ2MzdvdnI2ZXYzY2dsZGQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIzODQxMTg2MDU2NjAtdjdhdWo3dTNvMmRnYW4wZXZ2MzdvdnI2ZXYzY2dsZGQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDc2MTY2NDEwNTgzODc2NTA3NDgiLCJoZCI6InV0ZW0uY2wiLCJlbWFpbCI6InB2YXNxdWV6QHV0ZW0uY2wiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6InRBb2hrZF9RSkJiUDNxVUxuMktxN0EiLCJpYXQiOjE2ODkwMzg4NDgsImV4cCI6MTY4OTA0MjQ0OH0.XZ9nh5BHhrc-CTlWwlbIPIpQw3WSfU33raxF4eRVe_Z0cNw5K2MFheOXDx78MUgaDlJp8TB8RWDB0py58H0XYTtDbEP0jKf6wOkJI9G_FBf4rnKMMlKB2DOcwx6wGO6kcC6LPcKPUDec9wwUk8dZto2yhucEG3OdUuc_Mdaq2TVqAc7mbftxG50rLJzjI-f2NJ9jZ1syJ5W1TtGwvb9Re1j4nHHZW-HelyDFngJlVPuRTVuw0J7jKe66jy1F-v-Q3dbFGX8kBsg1xRSS_HwyjUhVqnx2UjddcoCfFj8lColdH0dax5U4ieJdwANSNzky-TH4nnMM2p9uq58x3kcxDg';
  final CoursesService coursesService = CoursesService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuApp(),
      appBar: AppBar(
        title: const Text('Lista de cursos'), 
        backgroundColor: Theme.of(context).primaryColorDark,),
      body: FutureBuilder(
        future: coursesService.coursesData(prueba), //NI IDEA COMO PASAR EL JWT
        builder: ((context, snapshot) {
          return snapshot.hasData ? ListView.separated(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index){
            final course  = snapshot.data![index]; 
            return ListTile(
              title: Text(course.name),
                subtitle: Text(course.code),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => Navigator.pushNamed(context, VoteScreen.routeName),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          ): Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColorDark,),);
        }
      ),
      

      ), 
        
          
    );
  }
}