import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:chastilock/state/session_manager.dart';

String endpoint = dotenv.get('API_BASE_URL');
String apiKey = dotenv.get('API_KEY');
String apiSecret = dotenv.get('API_SECRET');

final HttpLink httpLink = HttpLink(endpoint);

final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer ${await SessionManager().getSessionID()}'
);

final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );