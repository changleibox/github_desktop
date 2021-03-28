// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:github_desktop/third_party/github_graphql_schema/schema.docs.schema.gql.dart'
    as _i1;

class $ViewerDetail {
  const $ViewerDetail(this.data);

  final Map<String, dynamic> data;

  $ViewerDetail$viewer get viewer => data['viewer'] == null
      ? null
      : $ViewerDetail$viewer((data['viewer'] as Map<String, dynamic>));
}

class $ViewerDetail$viewer {
  const $ViewerDetail$viewer(this.data);

  final Map<String, dynamic> data;

  String get login => (data['login'] as String);
  _i1.URI get avatarUrl => _i1.URI((data['avatarUrl'] as String));
  _i1.URI get url => _i1.URI((data['url'] as String));
  String get name => (data['name'] as String);
  $ViewerDetail$viewer$status get status => data['status'] == null
      ? null
      : $ViewerDetail$viewer$status((data['status'] as Map<String, dynamic>));
  String get location => (data['location'] as String);
  $ViewerDetail$viewer$repositories get repositories => data['repositories'] ==
          null
      ? null
      : $ViewerDetail$viewer$repositories(
          (data['repositories'] as Map<String, dynamic>));
  $ViewerDetail$viewer$followers get followers => data['followers'] == null
      ? null
      : $ViewerDetail$viewer$followers(
          (data['followers'] as Map<String, dynamic>));
  $ViewerDetail$viewer$following get following => data['following'] == null
      ? null
      : $ViewerDetail$viewer$following(
          (data['following'] as Map<String, dynamic>));
  $ViewerDetail$viewer$starredRepositories get starredRepositories =>
      data['starredRepositories'] == null
          ? null
          : $ViewerDetail$viewer$starredRepositories(
              (data['starredRepositories'] as Map<String, dynamic>));
}

class $ViewerDetail$viewer$status {
  const $ViewerDetail$viewer$status(this.data);

  final Map<String, dynamic> data;

  String get emoji => (data['emoji'] as String);
  _i1.HTML get emojiHTML => _i1.HTML((data['emojiHTML'] as String));
  String get message => (data['message'] as String);
}

class $ViewerDetail$viewer$repositories {
  const $ViewerDetail$viewer$repositories(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $ViewerDetail$viewer$followers {
  const $ViewerDetail$viewer$followers(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $ViewerDetail$viewer$following {
  const $ViewerDetail$viewer$following(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $ViewerDetail$viewer$starredRepositories {
  const $ViewerDetail$viewer$starredRepositories(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $AssignedPullRequests {
  const $AssignedPullRequests(this.data);

  final Map<String, dynamic> data;

  $AssignedPullRequests$search get search => data['search'] == null
      ? null
      : $AssignedPullRequests$search((data['search'] as Map<String, dynamic>));
}

class $AssignedPullRequests$search {
  const $AssignedPullRequests$search(this.data);

  final Map<String, dynamic> data;

  List<$AssignedPullRequests$search$edges> get edges => data['edges'] == null
      ? null
      : (data['edges'] as List)
          .map((dynamic e) =>
              $AssignedPullRequests$search$edges((e as Map<String, dynamic>)))
          .toList();
}

class $AssignedPullRequests$search$edges {
  const $AssignedPullRequests$search$edges(this.data);

  final Map<String, dynamic> data;

  $AssignedPullRequests$search$edges$node get node => data['node'] == null
      ? null
      : $AssignedPullRequests$search$edges$node(
          (data['node'] as Map<String, dynamic>));
}

class $AssignedPullRequests$search$edges$node {
  const $AssignedPullRequests$search$edges$node.fromData(this.data);

  factory $AssignedPullRequests$search$edges$node(data) {
    switch (data['__typename']) {
      case "PullRequest":
        return $AssignedPullRequests$search$edges$node$asPullRequest(data);
      default:
        return $AssignedPullRequests$search$edges$node.fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedPullRequests$search$edges$node$asPullRequest
    implements $AssignedPullRequests$search$edges$node {
  const $AssignedPullRequests$search$edges$node$asPullRequest(this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  $AssignedPullRequests$search$edges$node$asPullRequest$repository
      get repository => data['repository'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$repository(
              (data['repository'] as Map<String, dynamic>));
  int get number => (data['number'] as int);
  _i1.URI get url => _i1.URI((data['url'] as String));
  String get title => (data['title'] as String);
  $AssignedPullRequests$search$edges$node$asPullRequest$author get author =>
      data['author'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$author(
              (data['author'] as Map<String, dynamic>));
  _i1.DateTime get createdAt => _i1.DateTime((data['createdAt'] as String));
  _i1.DateTime get closedAt => _i1.DateTime((data['closedAt'] as String));
  $AssignedPullRequests$search$edges$node$asPullRequest$labels get labels =>
      data['labels'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$labels(
              (data['labels'] as Map<String, dynamic>));
  $AssignedPullRequests$search$edges$node$asPullRequest$comments get comments =>
      data['comments'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$comments(
              (data['comments'] as Map<String, dynamic>));
  $AssignedPullRequests$search$edges$node$asPullRequest$assignees
      get assignees => data['assignees'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$assignees(
              (data['assignees'] as Map<String, dynamic>));
  $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems
      get timelineItems => data['timelineItems'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems(
              (data['timelineItems'] as Map<String, dynamic>));
}

class $AssignedPullRequests$search$edges$node$asPullRequest$repository {
  const $AssignedPullRequests$search$edges$node$asPullRequest$repository(
      this.data);

  final Map<String, dynamic> data;

  String get nameWithOwner => (data['nameWithOwner'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $AssignedPullRequests$search$edges$node$asPullRequest$author {
  const $AssignedPullRequests$search$edges$node$asPullRequest$author(this.data);

  final Map<String, dynamic> data;

  String get login => (data['login'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $AssignedPullRequests$search$edges$node$asPullRequest$labels {
  const $AssignedPullRequests$search$edges$node$asPullRequest$labels(this.data);

  final Map<String, dynamic> data;

  List<$AssignedPullRequests$search$edges$node$asPullRequest$labels$nodes>
      get nodes => data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedPullRequests$search$edges$node$asPullRequest$labels$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $AssignedPullRequests$search$edges$node$asPullRequest$labels$nodes {
  const $AssignedPullRequests$search$edges$node$asPullRequest$labels$nodes(
      this.data);

  final Map<String, dynamic> data;

  String get name => (data['name'] as String);
  String get color => (data['color'] as String);
}

class $AssignedPullRequests$search$edges$node$asPullRequest$comments {
  const $AssignedPullRequests$search$edges$node$asPullRequest$comments(
      this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $AssignedPullRequests$search$edges$node$asPullRequest$assignees {
  const $AssignedPullRequests$search$edges$node$asPullRequest$assignees(
      this.data);

  final Map<String, dynamic> data;

  List<$AssignedPullRequests$search$edges$node$asPullRequest$assignees$nodes>
      get nodes => data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedPullRequests$search$edges$node$asPullRequest$assignees$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $AssignedPullRequests$search$edges$node$asPullRequest$assignees$nodes {
  const $AssignedPullRequests$search$edges$node$asPullRequest$assignees$nodes(
      this.data);

  final Map<String, dynamic> data;

  _i1.URI get avatarUrl => _i1.URI((data['avatarUrl'] as String));
  String get name => (data['name'] as String);
}

class $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems {
  const $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems(
      this.data);

  final Map<String, dynamic> data;

  List<$AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes>
      get nodes => data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
  int get filteredCount => (data['filteredCount'] as int);
}

class $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes {
  const $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes.fromData(
      this.data);

  factory $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes(
      data) {
    switch (data['__typename']) {
      case "CrossReferencedEvent":
        return $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent(
            data);
      default:
        return $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes
            .fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent
    implements
        $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes {
  const $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent(
      this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  bool get isCrossRepository => (data['isCrossRepository'] as bool);
  $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source
      get source => data['source'] == null
          ? null
          : $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source(
              (data['source'] as Map<String, dynamic>));
}

class $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source {
  const $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source.fromData(
      this.data);

  factory $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source(
      data) {
    switch (data['__typename']) {
      case "PullRequest":
        return $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest(
            data);
      default:
        return $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source
            .fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest
    implements
        $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source {
  const $AssignedPullRequests$search$edges$node$asPullRequest$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest(
      this.data);

  final Map<String, dynamic> data;

  String get title => (data['title'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $AssignedIssues {
  const $AssignedIssues(this.data);

  final Map<String, dynamic> data;

  $AssignedIssues$search get search => data['search'] == null
      ? null
      : $AssignedIssues$search((data['search'] as Map<String, dynamic>));
}

class $AssignedIssues$search {
  const $AssignedIssues$search(this.data);

  final Map<String, dynamic> data;

  List<$AssignedIssues$search$edges> get edges => data['edges'] == null
      ? null
      : (data['edges'] as List)
          .map((dynamic e) =>
              $AssignedIssues$search$edges((e as Map<String, dynamic>)))
          .toList();
}

class $AssignedIssues$search$edges {
  const $AssignedIssues$search$edges(this.data);

  final Map<String, dynamic> data;

  $AssignedIssues$search$edges$node get node => data['node'] == null
      ? null
      : $AssignedIssues$search$edges$node(
          (data['node'] as Map<String, dynamic>));
}

class $AssignedIssues$search$edges$node {
  const $AssignedIssues$search$edges$node.fromData(this.data);

  factory $AssignedIssues$search$edges$node(data) {
    switch (data['__typename']) {
      case "Issue":
        return $AssignedIssues$search$edges$node$asIssue(data);
      default:
        return $AssignedIssues$search$edges$node.fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedIssues$search$edges$node$asIssue
    implements $AssignedIssues$search$edges$node {
  const $AssignedIssues$search$edges$node$asIssue(this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  $AssignedIssues$search$edges$node$asIssue$repository get repository =>
      data['repository'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$repository(
              (data['repository'] as Map<String, dynamic>));
  int get number => (data['number'] as int);
  _i1.URI get url => _i1.URI((data['url'] as String));
  String get title => (data['title'] as String);
  $AssignedIssues$search$edges$node$asIssue$author get author =>
      data['author'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$author(
              (data['author'] as Map<String, dynamic>));
  _i1.DateTime get createdAt => _i1.DateTime((data['createdAt'] as String));
  _i1.DateTime get closedAt => _i1.DateTime((data['closedAt'] as String));
  $AssignedIssues$search$edges$node$asIssue$labels get labels =>
      data['labels'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$labels(
              (data['labels'] as Map<String, dynamic>));
  $AssignedIssues$search$edges$node$asIssue$comments get comments =>
      data['comments'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$comments(
              (data['comments'] as Map<String, dynamic>));
  $AssignedIssues$search$edges$node$asIssue$assignees get assignees =>
      data['assignees'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$assignees(
              (data['assignees'] as Map<String, dynamic>));
  $AssignedIssues$search$edges$node$asIssue$timelineItems get timelineItems =>
      data['timelineItems'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$timelineItems(
              (data['timelineItems'] as Map<String, dynamic>));
}

class $AssignedIssues$search$edges$node$asIssue$repository {
  const $AssignedIssues$search$edges$node$asIssue$repository(this.data);

  final Map<String, dynamic> data;

  String get nameWithOwner => (data['nameWithOwner'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $AssignedIssues$search$edges$node$asIssue$author {
  const $AssignedIssues$search$edges$node$asIssue$author(this.data);

  final Map<String, dynamic> data;

  String get login => (data['login'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $AssignedIssues$search$edges$node$asIssue$labels {
  const $AssignedIssues$search$edges$node$asIssue$labels(this.data);

  final Map<String, dynamic> data;

  List<$AssignedIssues$search$edges$node$asIssue$labels$nodes> get nodes =>
      data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedIssues$search$edges$node$asIssue$labels$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $AssignedIssues$search$edges$node$asIssue$labels$nodes {
  const $AssignedIssues$search$edges$node$asIssue$labels$nodes(this.data);

  final Map<String, dynamic> data;

  String get name => (data['name'] as String);
  String get color => (data['color'] as String);
}

class $AssignedIssues$search$edges$node$asIssue$comments {
  const $AssignedIssues$search$edges$node$asIssue$comments(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $AssignedIssues$search$edges$node$asIssue$assignees {
  const $AssignedIssues$search$edges$node$asIssue$assignees(this.data);

  final Map<String, dynamic> data;

  List<$AssignedIssues$search$edges$node$asIssue$assignees$nodes> get nodes =>
      data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedIssues$search$edges$node$asIssue$assignees$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $AssignedIssues$search$edges$node$asIssue$assignees$nodes {
  const $AssignedIssues$search$edges$node$asIssue$assignees$nodes(this.data);

  final Map<String, dynamic> data;

  _i1.URI get avatarUrl => _i1.URI((data['avatarUrl'] as String));
  String get name => (data['name'] as String);
}

class $AssignedIssues$search$edges$node$asIssue$timelineItems {
  const $AssignedIssues$search$edges$node$asIssue$timelineItems(this.data);

  final Map<String, dynamic> data;

  List<$AssignedIssues$search$edges$node$asIssue$timelineItems$nodes>
      get nodes => data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
  int get filteredCount => (data['filteredCount'] as int);
}

class $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes {
  const $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes.fromData(
      this.data);

  factory $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes(data) {
    switch (data['__typename']) {
      case "CrossReferencedEvent":
        return $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent(
            data);
      default:
        return $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes
            .fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent
    implements $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes {
  const $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent(
      this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  bool get isCrossRepository => (data['isCrossRepository'] as bool);
  $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source
      get source => data['source'] == null
          ? null
          : $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source(
              (data['source'] as Map<String, dynamic>));
}

class $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source {
  const $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source.fromData(
      this.data);

  factory $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source(
      data) {
    switch (data['__typename']) {
      case "PullRequest":
        return $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest(
            data);
      default:
        return $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source
            .fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest
    implements
        $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source {
  const $AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent$source$asPullRequest(
      this.data);

  final Map<String, dynamic> data;

  String get title => (data['title'] as String);
  _i1.URI get url => _i1.URI((data['url'] as String));
}

class $Repositories {
  const $Repositories(this.data);

  final Map<String, dynamic> data;

  $Repositories$search get search => data['search'] == null
      ? null
      : $Repositories$search((data['search'] as Map<String, dynamic>));
}

class $Repositories$search {
  const $Repositories$search(this.data);

  final Map<String, dynamic> data;

  int get repositoryCount => (data['repositoryCount'] as int);
  $Repositories$search$pageInfo get pageInfo => data['pageInfo'] == null
      ? null
      : $Repositories$search$pageInfo(
          (data['pageInfo'] as Map<String, dynamic>));
  List<$Repositories$search$edges> get edges => data['edges'] == null
      ? null
      : (data['edges'] as List)
          .map((dynamic e) =>
              $Repositories$search$edges((e as Map<String, dynamic>)))
          .toList();
}

class $Repositories$search$pageInfo {
  const $Repositories$search$pageInfo(this.data);

  final Map<String, dynamic> data;

  String get endCursor => (data['endCursor'] as String);
  bool get hasNextPage => (data['hasNextPage'] as bool);
  bool get hasPreviousPage => (data['hasPreviousPage'] as bool);
  String get startCursor => (data['startCursor'] as String);
}

class $Repositories$search$edges {
  const $Repositories$search$edges(this.data);

  final Map<String, dynamic> data;

  $Repositories$search$edges$node get node => data['node'] == null
      ? null
      : $Repositories$search$edges$node((data['node'] as Map<String, dynamic>));
}

class $Repositories$search$edges$node {
  const $Repositories$search$edges$node.fromData(this.data);

  factory $Repositories$search$edges$node(data) {
    switch (data['__typename']) {
      case "Repository":
        return $Repositories$search$edges$node$asRepository(data);
      default:
        return $Repositories$search$edges$node.fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $Repositories$search$edges$node$asRepository
    implements $Repositories$search$edges$node {
  const $Repositories$search$edges$node$asRepository(this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  String get name => (data['name'] as String);
  String get description => (data['description'] as String);
  bool get isFork => (data['isFork'] as bool);
  bool get isPrivate => (data['isPrivate'] as bool);
  bool get viewerHasStarred => (data['viewerHasStarred'] as bool);
  _i1.URI get openGraphImageUrl =>
      _i1.URI((data['openGraphImageUrl'] as String));
  _i1.URI get mirrorUrl => _i1.URI((data['mirrorUrl'] as String));
  $Repositories$search$edges$node$asRepository$stargazers get stargazers =>
      data['stargazers'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$stargazers(
              (data['stargazers'] as Map<String, dynamic>));
  $Repositories$search$edges$node$asRepository$languages get languages =>
      data['languages'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$languages(
              (data['languages'] as Map<String, dynamic>));
  $Repositories$search$edges$node$asRepository$licenseInfo get licenseInfo =>
      data['licenseInfo'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$licenseInfo(
              (data['licenseInfo'] as Map<String, dynamic>));
  int get forkCount => (data['forkCount'] as int);
  $Repositories$search$edges$node$asRepository$parent get parent =>
      data['parent'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$parent(
              (data['parent'] as Map<String, dynamic>));
  _i1.URI get url => _i1.URI((data['url'] as String));
  $Repositories$search$edges$node$asRepository$issues get issues =>
      data['issues'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$issues(
              (data['issues'] as Map<String, dynamic>));
  $Repositories$search$edges$node$asRepository$owner get owner =>
      data['owner'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$owner(
              (data['owner'] as Map<String, dynamic>));
  _i1.DateTime get updatedAt => _i1.DateTime((data['updatedAt'] as String));
  _i1.DateTime get pushedAt => _i1.DateTime((data['pushedAt'] as String));
  _i1.DateTime get createdAt => _i1.DateTime((data['createdAt'] as String));
  String get nameWithOwner => (data['nameWithOwner'] as String);
  $Repositories$search$edges$node$asRepository$refs get refs => data['refs'] ==
          null
      ? null
      : $Repositories$search$edges$node$asRepository$refs(
          (data['refs'] as Map<String, dynamic>));
}

class $Repositories$search$edges$node$asRepository$stargazers {
  const $Repositories$search$edges$node$asRepository$stargazers(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $Repositories$search$edges$node$asRepository$languages {
  const $Repositories$search$edges$node$asRepository$languages(this.data);

  final Map<String, dynamic> data;

  List<$Repositories$search$edges$node$asRepository$languages$nodes>
      get nodes => data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $Repositories$search$edges$node$asRepository$languages$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $Repositories$search$edges$node$asRepository$languages$nodes {
  const $Repositories$search$edges$node$asRepository$languages$nodes(this.data);

  final Map<String, dynamic> data;

  String get color => (data['color'] as String);
  String get name => (data['name'] as String);
}

class $Repositories$search$edges$node$asRepository$licenseInfo {
  const $Repositories$search$edges$node$asRepository$licenseInfo(this.data);

  final Map<String, dynamic> data;

  String get name => (data['name'] as String);
}

class $Repositories$search$edges$node$asRepository$parent {
  const $Repositories$search$edges$node$asRepository$parent(this.data);

  final Map<String, dynamic> data;

  String get name => (data['name'] as String);
  String get nameWithOwner => (data['nameWithOwner'] as String);
  $Repositories$search$edges$node$asRepository$parent$owner get owner =>
      data['owner'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$parent$owner(
              (data['owner'] as Map<String, dynamic>));
  int get forkCount => (data['forkCount'] as int);
}

class $Repositories$search$edges$node$asRepository$parent$owner {
  const $Repositories$search$edges$node$asRepository$parent$owner(this.data);

  final Map<String, dynamic> data;

  String get login => (data['login'] as String);
  _i1.URI get avatarUrl => _i1.URI((data['avatarUrl'] as String));
}

class $Repositories$search$edges$node$asRepository$issues {
  const $Repositories$search$edges$node$asRepository$issues(this.data);

  final Map<String, dynamic> data;

  int get totalCount => (data['totalCount'] as int);
}

class $Repositories$search$edges$node$asRepository$owner {
  const $Repositories$search$edges$node$asRepository$owner(this.data);

  final Map<String, dynamic> data;

  String get login => (data['login'] as String);
  _i1.URI get avatarUrl => _i1.URI((data['avatarUrl'] as String));
}

class $Repositories$search$edges$node$asRepository$refs {
  const $Repositories$search$edges$node$asRepository$refs(this.data);

  final Map<String, dynamic> data;

  List<$Repositories$search$edges$node$asRepository$refs$nodes> get nodes =>
      data['nodes'] == null
          ? null
          : (data['nodes'] as List)
              .map((dynamic e) =>
                  $Repositories$search$edges$node$asRepository$refs$nodes(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $Repositories$search$edges$node$asRepository$refs$nodes {
  const $Repositories$search$edges$node$asRepository$refs$nodes(this.data);

  final Map<String, dynamic> data;

  $Repositories$search$edges$node$asRepository$refs$nodes$target get target =>
      data['target'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$refs$nodes$target(
              (data['target'] as Map<String, dynamic>));
}

class $Repositories$search$edges$node$asRepository$refs$nodes$target {
  const $Repositories$search$edges$node$asRepository$refs$nodes$target.fromData(
      this.data);

  factory $Repositories$search$edges$node$asRepository$refs$nodes$target(data) {
    switch (data['__typename']) {
      case "Commit":
        return $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit(
            data);
      default:
        return $Repositories$search$edges$node$asRepository$refs$nodes$target
            .fromData(data);
    }
  }

  final Map<String, dynamic> data;
}

class $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit
    implements $Repositories$search$edges$node$asRepository$refs$nodes$target {
  const $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit(
      this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history
      get history => data['history'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history(
              (data['history'] as Map<String, dynamic>));
}

class $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history {
  const $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history(
      this.data);

  final Map<String, dynamic> data;

  List<$Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges>
      get edges => data['edges'] == null
          ? null
          : (data['edges'] as List)
              .map((dynamic e) =>
                  $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges(
                      (e as Map<String, dynamic>)))
              .toList();
}

class $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges {
  const $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges(
      this.data);

  final Map<String, dynamic> data;

  $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges$node
      get node => data['node'] == null
          ? null
          : $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges$node(
              (data['node'] as Map<String, dynamic>));
}

class $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges$node {
  const $Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit$history$edges$node(
      this.data);

  final Map<String, dynamic> data;

  String get message => (data['message'] as String);
  _i1.DateTime get committedDate =>
      _i1.DateTime((data['committedDate'] as String));
}
