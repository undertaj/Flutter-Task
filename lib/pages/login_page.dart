import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png",
          fit: BoxFit.cover,
          ),

          const SizedBox(
            height: 20.0,
          ),

          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            )
            ),

          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                  hintText: "Enter username",
                  labelText: "Username"
                )
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password"
                    )
                ),
              ],
            ),
          )
        ]
    )
    );
  }
}
