import 'package:appclases/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (_) => const MyHomePage(title: 'hola',),
        LogScreen.routeName: (_) => const LogScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        VoteScreen.routeName: (_) => const VoteScreen(),
<<<<<<< HEAD
        IntegrantScreen.routeName: (_) => const IntegrantScreen(),
        MenuApp.routeName: (_) => const MenuApp(),
        ResultScreen.routeName: (_) => const ResultScreen(),
=======
>>>>>>> b520111b2ef9c49485496d6af7680ccacca88718
      },
    );
  }

  
}

class MyHomePage extends StatefulWidget {
  static const routeName = 'my_home';
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAuthenticated = false;

  // ignore: unused_element
  void _checkAuthentication() {
    setState(() => _isAuthenticated = true);
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? const HomeScreen() : const LogScreen();
  }
}