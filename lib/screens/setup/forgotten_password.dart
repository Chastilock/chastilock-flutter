import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:auto_route/auto_route.dart';

import 'package:chastilock/helpers/email_helpers.dart';
import 'package:chastilock/api/queries/forgottenpassword.dart';

class ForgottenPage extends StatefulWidget {
  const ForgottenPage({Key? key}) : super(key: key);

  @override
  ForgottenPageState createState() {
    return ForgottenPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ForgottenPageState extends State<ForgottenPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final router = AutoRouter.of(context);
    String? email;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the LoginScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Forgotten Password'),
        ),
        body: (Form(
            key: _formKey,
            child: ListView(padding: const EdgeInsets.all(5), children: [
              const Text(
                  'If you have forgetten your password and have given us your email address, please provide it below and we can email you a link to reset it 🙂',
                  style: TextStyle(fontSize: 16)),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      onSaved: (String? value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          hintText: 'me@example.com'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a email address';
                        }
                        if (EmailHelpers.isEmailValid(value) == false) {
                          return 'Please check that email address is valid';
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Mutation(
                      options: MutationOptions(
                        document: gql(forgottenPasswordQuery),
                        onCompleted: (dynamic resultData) {
                          if (resultData != null) {
                            if (resultData['requestPasswordChange']
                                    ['PasswordReset_ID'] !=
                                null) {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const SingleChildScrollView(
                                        child: Text(
                                            'An email has been sent to your email address with a link. That link will expire in 1 hour.')),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          router.pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
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
                                      runMutation({'Email': email})
                                    }
                                },
                            child: const Text('Submit'));
                      })),
            ]))));
  }
}
