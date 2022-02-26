import 'package:chastilock/api/connect.dart';
import 'package:graphql/client.dart';

Future<String> forgettonPasssword(String emailIn) async {
  final GraphQLClient _client = await getGraphqlClient();

  final MutationOptions options = MutationOptions(
    document: gql(
      r'''
        mutation requestPasswordChange($Email: String!) {
          requestPasswordChange(Email: $Email) {
            PasswordReset_ID
          }
        }
      ''',
    ),
    variables: <String, dynamic>{'Email': emailIn},
  );

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    throw Exception(result.exception!.graphqlErrors[0]);
  } else {
    return result.data as String;
  }
}
