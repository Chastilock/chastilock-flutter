String loginQuery = """
  mutation login(\$Username: String!, \$Password: String!) {
    login(Username: \$Username, Password: \$Password) {
      Token
    }
  }
""";