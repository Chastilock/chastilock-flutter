import 'package:chastilock/api/queries/login.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:chastilock/router.gr.dart';
import 'package:chastilock/state/session_manager.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  void clearPassword() {
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final router = AutoRouter.of(context);
    String? username;
    String? password;    
    
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the LoginPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Login'),
        ),
        body: (Form(
            key: _formKey,
            child: ListView(padding: const EdgeInsets.all(10), children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      onSaved: (String? value) {
                        username = value;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          hintText: 'L0ckmeup21'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: passwordController,
                      onSaved: (String? value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'mySuperSecretP@assword1'),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Mutation(options: MutationOptions(
                    document: gql(loginQuery),
                    onCompleted: (dynamic resultData) {
                      print('ResultData is $resultData');
                    },
                    ),
                    builder: (
                      RunMutation runMutation,
                      QueryResult? result,
                      ) {
                        return ElevatedButton(
                          onPressed: () => {
                            if(_formKey.currentState!.validate()) {
                              _formKey.currentState!.save(),
                              runMutation({'Username': username, 'Password': password})
                            }
                            },
                          child: const Text('Login'));
                      })),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    router.push(const ForgottenRoute());
                  },
                  child: const Text('Forgotten Password'),
                ),
              )
            ]))));
  }
}
