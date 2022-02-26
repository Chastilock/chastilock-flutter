import 'package:chastilock/api/forgotten_password.dart';
import 'package:chastilock/helpers/email_helpers.dart';
import 'package:flutter/material.dart';

class ForgottenScreen extends StatefulWidget {
  const ForgottenScreen({Key? key}) : super(key: key);

  @override
  ForgottenScreenState createState() {
    return ForgottenScreenState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ForgottenScreenState extends State<ForgottenScreen> {
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
          title: const Text("Forgotten Password"),
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
                          labelText: "Email",
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
                          String response = await forgettonPasssword(email!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(response.toString())),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      }
                    },
                    child: const Text("Submit")),
              )
            ]))));
  }
}
