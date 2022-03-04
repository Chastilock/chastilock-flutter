import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../mutate.dart';

Future<String> login(
    String usernameIn, String passwordIn, BuildContext mContext) async {
  final mutVariables = <String, dynamic>{
    'Username': usernameIn,
    'Password': passwordIn
  };

  QueryResult result = await runMutation(r'''
        mutation login($Username: String!, $Password: String!) {
          login(Username: $Username, Password: $Password) {
            Token
          }
        }
      ''', mutVariables, mContext);
  return result.data!['login']['Token'] as String;
}
