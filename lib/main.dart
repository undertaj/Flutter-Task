import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/forgot_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/register_page.dart';
import 'package:my_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import '../utils/utils.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'Firebase Auth';

  @override
  Widget build(BuildContext context) =>MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      routes: {
        "/" : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.registerRoute : (context) => RegisterPage(),
        MyRoutes.forgotRoute : (context) => ForgotPage()
     },
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError){
          return Center(child: Text('Something went wrong!'));
        }
        else if(snapshot.hasData) {
          return HomePage();
        }
        else {
          return LoginPage();
        }
      },
    ),

  );
    // return MaterialApp(
    //   themeMode: ThemeMode.light,
    //
    //   debugShowCheckedModeBanner: false,
    //
    //   theme: ThemeData(
    //       primarySwatch: Colors.deepPurple,
    //   // textTheme: GoogleFonts.latoTextTheme()
    //       fontFamily: GoogleFonts.lato().fontFamily
    //   ),
    //   darkTheme: ThemeData(brightness: Brightness.dark),
    //
    //
    //
    //
    //
    //
    //
    // );
  }


