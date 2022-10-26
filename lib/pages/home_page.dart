import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard")
        ),

      body:Center(
        child:Column(
          children: [
            Text("Welcome\nSigned in as:"),
            SizedBox(height: 8),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                child: Text('Sign out'))
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
