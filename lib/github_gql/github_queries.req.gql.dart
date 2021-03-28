// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql_exec/gql_exec.dart' as _i1;
import 'package:github_desktop/github_gql/github_queries.var.gql.dart' as _i2;
import 'package:github_desktop/github_gql/github_queries.op.gql.dart' as _i3;

class ViewerDetail extends _i1.Request {
  ViewerDetail(
      _i2.ViewerDetailVarBuilder Function(_i2.ViewerDetailVarBuilder) buildVars)
      : super(
            operation: _i3.ViewerDetail,
            variables: buildVars(_i2.ViewerDetailVarBuilder()).variables);
}

class AssignedPullRequests extends _i1.Request {
  AssignedPullRequests(
      _i2.AssignedPullRequestsVarBuilder Function(
              _i2.AssignedPullRequestsVarBuilder)
          buildVars)
      : super(
            operation: _i3.AssignedPullRequests,
            variables:
                buildVars(_i2.AssignedPullRequestsVarBuilder()).variables);
}

class AssignedIssues extends _i1.Request {
  AssignedIssues(
      _i2.AssignedIssuesVarBuilder Function(_i2.AssignedIssuesVarBuilder)
          buildVars)
      : super(
            operation: _i3.AssignedIssues,
            variables: buildVars(_i2.AssignedIssuesVarBuilder()).variables);
}

class Repositories extends _i1.Request {
  Repositories(
      _i2.RepositoriesVarBuilder Function(_i2.RepositoriesVarBuilder) buildVars)
      : super(
            operation: _i3.Repositories,
            variables: buildVars(_i2.RepositoriesVarBuilder()).variables);
}
