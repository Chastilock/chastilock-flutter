import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

Future getGraphqlClient() async {
  await dotenv.load();
  String apiURL =
      dotenv.get('API_BASE_URL', fallback: 'https://127.0.0.1:4000');
  try {
    final Link _link = HttpLink(apiURL);
    return GraphQLClient(link: _link, cache: GraphQLCache());
  } catch (e) {
    return "Error setting up database connection";
  }
}
