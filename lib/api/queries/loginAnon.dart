String loginAnonQuery = '''
  mutation loginAnon(\$UUID: String!) {
    loginAnon(UUID: \$UUID) {
      Token
    }
  }
''';
