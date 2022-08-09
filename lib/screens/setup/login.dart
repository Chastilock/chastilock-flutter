import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:chastilock/router.gr.dart';
import 'package:chastilock/state/session_manager.dart';
import 'package:chastilock/api/queries/login.dart';

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
  final usernameController = TextEditingController();

  final usernameFocusNode = FocusNode();

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
                      autofocus: true,
                      focusNode: usernameFocusNode,
                      controller: usernameController,
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
                  child: Mutation(
                      options: MutationOptions(
                        document: gql(loginQuery),
                        onCompleted: (dynamic resultData) {
                          if (resultData != null) {
                            String token = resultData['login']['Token'];
                            SessionManager().setSessionID(token);
                            router.popUntilRoot();
                            router.push(const HomeRoute());
                          }
                        },
                        onError: (error) => showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                    children: error!.graphqlErrors
                                        .map((singleError) =>
                                            Text(singleError.message))
                                        .toList()),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    passwordController.clear();
                                    usernameController.clear();
                                    usernameFocusNode.requestFocus();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      builder: (
                        RunMutation runMutation,
                        QueryResult? result,
                      ) {
                        if (result!.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        }

                        return ElevatedButton(
                            onPressed: () => {
                                  if (_formKey.currentState!.validate())
                                    {
                                      _formKey.currentState!.save(),
                                      runMutation({
                                        'Username': username,
                                        'Password': password
                                      })
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
