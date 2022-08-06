String loginQuery = '''
  mutation Login(\$Username: String!, \$Password: String!) {
    login(input: {Username: \$Username, Password: \$Password}) {
      Token
    }
  }
''';