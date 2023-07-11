//import 'package:appclases/presentation/screens/home_screen.dart';
import 'package:appclases/services/voter.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  static String routeName = 'log_screen';
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

   return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          colorbox(size),
          safearea(),
          loginform(context)
        ],
      ),
    ),
   );
  
    
         
  }

  Column loginform(BuildContext context) {
    return Column(
          children: [
            const SizedBox(height: 300,),
            Container(
              padding: EdgeInsets.all(20.0,),
              margin: EdgeInsets.symmetric(horizontal: 30.0,),
              width: double.infinity,
              //height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0,),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0,5,),
                  ),],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10.0,),
                  Text( 'Login', style: Theme.of(context).textTheme.headlineMedium),
                  SizedBox( height: 30.0,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0,)),
                    color: Colors.lightGreen,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0,),
                      child: const Text('Ingresar', style: TextStyle(color: Colors.black),),
                    ),
                    onPressed: () => VoterService.login(context),
                    //onPressed: () {
                      //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    //},
                    ),
                ],

              ),
            ),
          ],
        );
  }

  SafeArea safearea() {
    return SafeArea(
          child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              width: double.infinity,
              child: const Icon(
                Icons.person_pin, 
                color: Colors.white, 
                size: 100,),
            
          ),
        );
  }

  Container colorbox(Size size) {
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
            Color.fromRGBO(82, 211, 140, 1),
            Color.fromRGBO(38, 101, 219, 1),
            ],
            )
          ),
          width: double.infinity,
          height: size.height * 1,
        );
  }
}
