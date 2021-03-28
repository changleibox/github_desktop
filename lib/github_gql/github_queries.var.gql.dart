// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:github_desktop/third_party/github_graphql_schema/schema.docs.schema.gql.dart'
    as _i1;

class ViewerDetailVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};
}

class AssignedPullRequestsVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set query(String value) => variables['query'] = value;
  set count(int value) => variables['count'] = value;
}

class AssignedIssuesVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set query(String value) => variables['query'] = value;
  set count(int value) => variables['count'] = value;
}

class RepositoriesVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set query(String value) => variables['query'] = value;
  set first(int value) => variables['first'] = value;
  set last(int value) => variables['last'] = value;
  set historySince(_i1.GitTimestamp value) =>
      variables['historySince'] = value.value;
  set before(String value) => variables['before'] = value;
  set after(String value) => variables['after'] = value;
}
