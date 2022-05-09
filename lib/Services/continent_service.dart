import 'package:graphql_flutter/graphql_flutter.dart';

import '../Models/continents_model.dart';
import '../Queries/queries.dart';
import '../config.dart';

class ApiService {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  AllQueries allQueries = AllQueries();

  Future<Data> getContinents() async {
    try {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(document: gql(allQueries.continentsQuery())));
      if (result.hasException) {
        print(result.exception.toString());
        return null!;
      }
      var response = result.data;
      final map = response as Map<String, dynamic>;
      Data mappedResult = Data.fromJson(map);
      return mappedResult;
    } catch (e) {
      print(e);
      return null!;
    }
  }
}
