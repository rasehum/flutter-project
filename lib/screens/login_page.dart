import 'package:flutter/material.dart';
import 'package:project_firebase/services/firebaseauth_service.dart';
import 'package:project_firebase/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool signUp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //hide back arrow button
        automaticallyImplyLeading: false,
        title: Text('Kitsu Shopping'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            if (signUp == true)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
              ),
            /* if (signUp == true)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: phoneController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                  ),
                ),
              ), */

            //Sign in / Sign up button
            RaisedButton(
              onPressed: () async {
                if (signUp) {
                  var newuser = await FirebaseAuthService().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text.trim(),
                    // phone: phoneController.text.trim()
                  );
                  if (newuser != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                } else {
                  var reguser = await FirebaseAuthService().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (reguser != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                }
              },
              child: signUp ? Text("Sign Up") : Text("Sign In"),
            ),
            //Sign up / Sign In toggler
            OutlineButton(
              onPressed: () {
                setState(() {
                  signUp = !signUp;
                });
              },
              child: signUp
                  ? Text("Have an account? Sign In")
                  : Text("Create an account"),
            )
          ],
        ),
      ),
    );
  } //build
}
