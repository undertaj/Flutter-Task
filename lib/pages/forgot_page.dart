import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    final img = "https://stories.freepiklabs.com/storage/19513/forgot-password-amico-1951.png";
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            Image.network(
              img,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 30.0,
            ),

            const Text("Enter your email and we'll send you a link to get back into your account."),

            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Email ID",
                labelText: "Email ID"
              )
            ),

            SizedBox(
              height: 20.0,
            ),

            ElevatedButton(
                child: Text("Send Login Link"),
              style: TextButton.styleFrom(minimumSize: Size(100, 40)),
              onPressed: () {},
            )

          ],
        ),
      ),
    );
  }
}

