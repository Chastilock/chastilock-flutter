import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:chastilock/api/custom_auth_link.dart';

String endpoint = dotenv.get('API_BASE_URL');

final HttpLink httpLink = HttpLink(endpoint);

final CustomAuthLink myCustomAuthLink = CustomAuthLink(); 

final Link link = myCustomAuthLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );