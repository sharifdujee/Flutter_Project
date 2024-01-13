import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:knowledge/firebase_options.dart';
import 'package:knowledge/screen/home_screen.dart';
import 'package:knowledge/screen/login_screen.dart';
import 'package:knowledge/screen/spalash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: const Color(0xFF55C1EF),
        useMaterial3: true,
      ),
     routes: {
        '/': (context)=> SplashScreen(
        ),
       '/login': (context)=> LoginScreen(),
       '/home': (context)=> Home(),
     },
     // home: const Home(),
    );
  }
}

