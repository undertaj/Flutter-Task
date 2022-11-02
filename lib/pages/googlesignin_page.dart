import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/pages/login_page.dart';

class GoogleSignInPage extends StatefulWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  State<GoogleSignInPage> createState() => _GoogleSignInPageState();
}
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email'
  ],
);

class _GoogleSignInPageState extends State<GoogleSignInPage> {
  GoogleSignInAccount? _currentuser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentuser = account;
      });
    });
      _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Flutter Google ign In'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: LoginPage()
      ),
    );
  }


}
