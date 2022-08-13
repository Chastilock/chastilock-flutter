String forgottenPasswordQuery = '''
  mutation requestPasswordChange(\$Email: String!) {
    requestPasswordChange(Email: \$Email) {
      PasswordReset_ID
    }
  }
''';
