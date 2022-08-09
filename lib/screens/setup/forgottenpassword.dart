import 'package:flutter/material.dart';

import 'package:chastilock/helpers/email_helpers.dart';

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
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                      }
                    },
                    child: const Text('Submit')),
              )
            ]))));
  }
}
