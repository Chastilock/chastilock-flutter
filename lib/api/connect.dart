import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

Future getGraphqlClient(BuildContext context) async {
  await dotenv.load();
  String apiURL =
      dotenv.get('API_BASE_URL', fallback: 'https://127.0.0.1:4000');
  final Link _link = HttpLink(apiURL);
  return GraphQLClient(link: _link, cache: GraphQLCache());
}
