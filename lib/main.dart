import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/forgot_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/register_page.dart';
import 'package:my_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
      // textTheme: GoogleFonts.latoTextTheme()
          fontFamily: GoogleFonts.lato().fontFamily
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),

      routes: {
        "/" : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.registerRoute : (context) => RegisterPage(),
        MyRoutes.forgotRoute : (context) => ForgotPage()
      },
    );
  }
}

