import '../mutate.dart';
import 'package:flutter/material.dart';

Future<bool> forgettonPasssword(String emailIn, BuildContext mContext) async {
  final mutVariables = <String, dynamic>{'Email': emailIn};

  await runMutation(r'''
        mutation requestPasswordChange($Email: String!) {
          requestPasswordChange(Email: $Email) {
            PasswordReset_ID
          }
        }
      ''', mutVariables, mContext);

  return true;
}
