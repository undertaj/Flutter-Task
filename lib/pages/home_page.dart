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
      ),
      drawer: Drawer(
        child:Column(
          children: [
            SizedBox(height: 30),
            Text("Welcome\nSigned in as:"),
            SizedBox(height: 8),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name:  ' + user.displayName!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email:  ' + user.email!,
              style: const TextStyle(
                  fontSize: 16,
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
    );
  }
}
