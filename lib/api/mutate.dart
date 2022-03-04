import 'package:chastilock/api/connect.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

Future<QueryResult> runMutation(
    String gqlString, mutVariables, BuildContext mContext) async {
  final GraphQLClient _client = await getGraphqlClient(mContext);

  final MutationOptions options =
      MutationOptions(document: gql(gqlString), variables: mutVariables);

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    //print(result.exception?.graphqlErrors[0] as String);
    throw showDialog(
        context: mContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
                for (int i = 0; i < result.exception!.graphqlErrors.length; i++)
                  Text(result.exception!.graphqlErrors[i].message)
              ]),
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
        });
  } else {
    return result;
  }
}
