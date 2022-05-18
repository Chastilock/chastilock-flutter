import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Just changed and needs testing :). Need to migrate the backend to use HTTP headers for API keys for simplicity
Future getGraphqlClient() async {
  await dotenv.load();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String apiURL =
      dotenv.get('API_BASE_URL', fallback: 'https://127.0.0.1:4000');
  String? loginToken = prefs.getString('LoginToken');

  final HttpLink httpLink = HttpLink(apiURL);
  final AuthLink authLink =
      AuthLink(getToken: () async => 'Bearer: $loginToken');

  final Link link = authLink.concat(httpLink);

  return GraphQLClient(link: link, cache: GraphQLCache());
}
