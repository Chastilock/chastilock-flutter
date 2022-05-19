import 'package:chastilock/api/mutations/forgotten_password.dart';
import 'package:chastilock/helpers/email_helpers.dart';
import 'package:flutter/material.dart';

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

    String? email;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the LoginScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Forgotten Password'),
        ),
        body: (Form(
            key: _formKey,
            child: ListView(padding: const EdgeInsets.all(10), children: [
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
                          return 'Please check that email address';
                        }

                        return null;
                      })),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        try {
                          // await forgettonPasssword(email!, context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'We have sent an email to your email address with further instructions.')),
                          );
                        } catch (e) {
                          // ignore: avoid_print
                          print('Failed to send forgotten password email');
                        }
                      }
                    },
                    child: const Text('Submit')),
              )
            ]))));
  }
}
