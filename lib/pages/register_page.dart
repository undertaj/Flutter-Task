import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../utils/utils.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/services.dart';


class  RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = "";
  bool changeButton = false;
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                  key: formKey,
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
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value!)){
                              return 'Enter correct first name';
                            }else {
                              return null;
                            }
                          }

                      ),// Name
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Last Name",
                          labelText: "Last Name",
                        ),
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value!)){
                              return 'Enter correct last name';
                            }else {
                              return null;
                            }
                          }
                      ),// LastName
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Email ID",
                          labelText: "Email ID",
                        ),
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value!)){
                              return 'Enter correct email';
                            }else {
                              return null;
                            }
                          }
                      ),// Email
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                          validator: (value) {
                            if(value!.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            else if(!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*]).{8,15}$').hasMatch(value!)){
                              return 'Enter correct password';
                            }else {
                              return null;
                            }
                          }
                      ),// Password
                      SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton(
                        child: Text("Sign Up"),
                        style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            // Navigator.pushNamed(context, MyRoutes.homeRoute);
                            signUp();
                          }
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
                ),
              )
            ],
          ),
        ));
  }
  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator())
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      Navigator.pushNamed(context, MyRoutes.verifyRoute);
    } on FirebaseAuthException catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.deepPurple)
      // );
      Utils.showSnackBar(e.toString());
    }

  }
}
