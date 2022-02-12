import 'package:chastilock/api/connect.dart';
import 'package:graphql/client.dart';

Future<String> login(String usernameIn, String passwordIn) async {
  final GraphQLClient _client = await getGraphqlClient();

  final MutationOptions options = MutationOptions(
    document: gql(
      r'''
        mutation login($Username: String!, $Password: String!) {
          login(Username: $Username, Password: $Password) {
            Token
          }
        }
      ''',
    ),
    variables: <String, dynamic>{
      'Username': usernameIn,
      'Password': passwordIn
    },
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    throw Exception(result.exception.toString());
  } else {
    return result.data!['login']['Token'] as String;
  }
}
