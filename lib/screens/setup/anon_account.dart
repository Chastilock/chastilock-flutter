import 'package:chastilock/api/queries/createanon.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:auto_route/auto_route.dart';

class CreateAnonPage extends StatefulWidget {
  const CreateAnonPage({Key? key}) : super(key: key);

  @override
  CreateAnonPageState createState() {
    return CreateAnonPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CreateAnonPageState extends State<CreateAnonPage> {
  TextEditingController uuidController = TextEditingController();

  bool generateAvailable = true;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final router = AutoRouter.of(context);
    String? UUID;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the LoginScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Create Anon Account'),
        ),
        body: (ListView(padding: const EdgeInsets.all(5), children: [
          const Text(
              'Shown below is an ID for your account. Please keep it safe and treat it like a password. It is all that is needed to login to your account and cannot be recovered or reset. You can always upgrade your account to use an email address and have password reset capabilities later',
              style: TextStyle(fontSize: 16)),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: uuidController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'UUID',
                    border: OutlineInputBorder(),
                  ))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Mutation(
                  options: MutationOptions(
                    document: gql(createAnonQuery),
                    onCompleted: (dynamic resultData) {
                      if (resultData != null) {
                        UUID = resultData['createUserAnon']['UUID'];
                        uuidController.text = UUID!;
                        generateAvailable = false;
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
                        onPressed:
                            generateAvailable ? () => {runMutation({})} : null,
                        child: const Text('Generate Account'));
                  })),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: const Text('Save Screenshot'),
              onPressed: () => {},
            ),
          )
        ])));
  }
}
