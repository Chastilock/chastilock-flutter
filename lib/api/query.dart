/* import 'package:chastilock/api/connect.dart';
import 'package:graphql/client.dart';

Future<String> allUsers() async {
  final GraphQLClient _client = await getGraphqlClient();

  final QueryOptions options = QueryOptions(document: gql("""
          query allUsers {
            allUsers {
              UUID
            }
          }
      """));

  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    return (result.exception.toString());
  } else {
    return (result.data.toString());
  }
}
 */