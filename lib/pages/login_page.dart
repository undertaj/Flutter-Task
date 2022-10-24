import 'package:flutter/material.dart';
import '../utils/routes.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  bool changeButton = false;

  @override
    Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                            return 'Enter correct name';
                          }else {
                            return null;
                          }
                        }
                        // onChanged: (value) {
                        //   name = value;
                        //
                        //   setState(() {});
                        //   },
                      ),
                      TextFormField(
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
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      // InkWell(
                      //   onTap: () async {
                      //     if (formKey.currentState!.validate()) {
                      //       const Text('Logging in');
                      //     }
                      //     else {
                      //       setState(() {
                      //         changeButton = true;
                      //       });
                      //       await Future.delayed(Duration(seconds: 1));
                      //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     }
                      //   },
                      //   child: AnimatedContainer(
                      //     duration: Duration(seconds: 1),
                      //     width: changeButton ? 50 : 150,
                      //     height: 50,
                      //     alignment: Alignment.center,
                      //     child: changeButton ? Icon(Icons.done, color: Colors.white,) : Text(
                      //       "Login",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 18),
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: Colors.deepPurple,
                      //       borderRadius:
                      //       BorderRadius.circular(changeButton ? 50 : 8),
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        child: Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            const Text('Logging in');
                            Navigator.pushNamed(context, MyRoutes.homeRoute);
                          }
                          },
                          ),

                          SizedBox(
                          height: 90.0,
                          ),

                          ElevatedButton(
                          child: Text("Forgot Password ?"),
                          style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                          onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.forgotRoute);
                          },
                          ),

                          SizedBox(
                          height: 5.0,
                          ),


                      const Text("Don't Have An Account ?"),
                      ElevatedButton(
                        child: Text("Sign Up"),
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.registerRoute);
                        },
                      )
          ],
          ),
                ),
        )
      ],
    ),
    ));
    }
    }