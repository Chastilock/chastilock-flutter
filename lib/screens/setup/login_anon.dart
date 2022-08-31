import 'package:flutter/material.dart';
import 'package:chastilock/api/queries/loginAnon.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chastilock/router.gr.dart';
import 'package:chastilock/state/session_manager.dart';

class LoginAnonPage extends StatefulWidget {
  const LoginAnonPage({Key? key}) : super(key: key);

  @override
  LoginAnonPageState createState() {
    return LoginAnonPageState();
  }
}

class LoginAnonPageState extends State<LoginAnonPage> {
  final _formKey = GlobalKey<FormState>();
  String? uuid;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the LoginScreen object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('Login Anonymously')),
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(10), children: [
            const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Please input your UUID below!',
                    style: TextStyle(fontSize: 16))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    autofocus: true,
                    autocorrect: false,
                    onSaved: (String? value) {
                      setState(() {
                        uuid = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a UUID';
                      }
                      if (value.length != 36) {
                        return 'Your UUID is too long or too short, please check it and try again';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'UUID',
                        border: OutlineInputBorder(),
                        hintText: 'e983ef33-2acc-45ff-8191-7f623d1f316f'))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Mutation(
                    options: MutationOptions(
                      document: gql(loginAnonQuery),
                      onCompleted: (dynamic resultData) {
                        if (resultData != null) {
                          String token = resultData['loginAnon']['Token'];
                          SessionManager().setSessionID(token);
                          router.popUntil((route) => false);
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
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }),
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
                                    runMutation({'UUID': uuid})
                                  }
                              },
                          child: const Text('Continue to App'));
                    }))
          ]),
        ));
  }
}
