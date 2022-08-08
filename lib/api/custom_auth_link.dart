import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:chastilock/state/session_manager.dart';

class CustomAuthLink extends Link {
  CustomAuthLink();

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    // Some logic here

    String apiKey = dotenv.get('API_KEY');
    String apiSecret = dotenv.get('API_SECRET');

    final String mToken = await SessionManager().getSessionID();

    // TIP: do not forget getting new Request instance!
    final Request req = request.updateContextEntry<HttpLinkHeaders>(
      (HttpLinkHeaders? headers) => HttpLinkHeaders(
        headers: <String, String>{
          // put oldest headers
          ...headers?.headers ?? <String, String>{},
          // and add a new headers
          'Authorization': 'Bearer $mToken',
          'x-api-key': apiKey,
          'x-api-secret': apiSecret
        },
      ),
    );

    // and "return" new Request with updated headers
    yield* forward!(req);
  }
}