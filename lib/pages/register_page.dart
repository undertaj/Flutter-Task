import 'package:flutter/material.dart';
import '../utils/routes.dart';


class  RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [


              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter First Name",
                        labelText: "First Name",
                      ),

                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Last Name",
                        labelText: "Last Name",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Email ID",
                        labelText: "Email ID",
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    ElevatedButton(
                      child: Text("Sign Up"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    ),

                    SizedBox(
                      height: 40.0,
                    ),

                    const Text("Already A User ?"),

                    ElevatedButton(
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginRoute);
                      },
                    ),

                  ],
                ),
              )



            ],
          ),
        ));
  }
}
