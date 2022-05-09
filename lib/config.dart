import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  GraphQLConfiguration();

  static HttpLink httpLink = HttpLink("https://countries.trevorblades.com/",
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    );
  }
}
