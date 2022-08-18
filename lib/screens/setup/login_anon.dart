import 'package:flutter/material.dart';

class LoginAnonPage extends StatefulWidget {
  const LoginAnonPage({Key? key}) : super(key: key);

  @override
  LoginAnonPageState createState() {
    return LoginAnonPageState();
  }
}

class LoginAnonPageState extends State<LoginAnonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the LoginScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Login Anonymously')),
      body: ListView(
          padding: const EdgeInsets.all(5),
          children: [Text("Please input your UUID below!")]),
    );
  }
}
