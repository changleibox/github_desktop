// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const ViewerDetail = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'ViewerDetail'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'viewer'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'login'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'avatarUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'emoji'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'emojiHTML'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null),
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'message'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'repositories'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'totalCount'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'followers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'totalCount'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'following'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'totalCount'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'starredRepositories'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'totalCount'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ]))
          ]))
    ]));
const AssignedPullRequests = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AssignedPullRequests'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'query')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'count')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'search'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'query'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'query'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'type'),
                value: _i1.EnumValueNode(name: _i1.NameNode(value: 'ISSUE'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'count')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'node'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'PullRequest'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: '__typename'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'repository'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(
                                            value: 'nameWithOwner'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'url'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'number'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'url'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'title'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'author'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'login'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'url'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'createdAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'closedAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'labels'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100'))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name: _i1.NameNode(value: 'name'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name:
                                                  _i1.NameNode(value: 'color'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ]))
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'comments'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'totalCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'assignees'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100'))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name: _i1.NameNode(
                                                  value: 'avatarUrl'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name: _i1.NameNode(value: 'name'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ]))
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'timelineItems'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100')),
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'itemTypes'),
                                        value: _i1.ListValueNode(values: [
                                          _i1.EnumValueNode(
                                              name: _i1.NameNode(
                                                  value:
                                                      'CROSS_REFERENCED_EVENT'))
                                        ]))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: _i1.SelectionSetNode(
                                            selections: [
                                              _i1.InlineFragmentNode(
                                                  typeCondition:
                                                      _i1.TypeConditionNode(
                                                          on: _i1.NamedTypeNode(
                                                              name: _i1.NameNode(
                                                                  value:
                                                                      'CrossReferencedEvent'),
                                                              isNonNull:
                                                                  false)),
                                                  directives: [],
                                                  selectionSet:
                                                      _i1.SelectionSetNode(
                                                          selections: [
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    '__typename'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null),
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    'isCrossRepository'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null),
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    'source'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: _i1
                                                                .SelectionSetNode(
                                                                    selections: [
                                                                  _i1.InlineFragmentNode(
                                                                      typeCondition: _i1.TypeConditionNode(on: _i1.NamedTypeNode(name: _i1.NameNode(value: 'PullRequest'), isNonNull: false)),
                                                                      directives: [],
                                                                      selectionSet: _i1.SelectionSetNode(selections: [
                                                                        _i1.FieldNode(
                                                                            name:
                                                                                _i1.NameNode(value: 'title'),
                                                                            alias: null,
                                                                            arguments: [],
                                                                            directives: [],
                                                                            selectionSet: null),
                                                                        _i1.FieldNode(
                                                                            name:
                                                                                _i1.NameNode(value: 'url'),
                                                                            alias: null,
                                                                            arguments: [],
                                                                            directives: [],
                                                                            selectionSet: null)
                                                                      ]))
                                                                ]))
                                                      ]))
                                            ])),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(
                                            value: 'filteredCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ]))
                            ]))
                      ]))
                ]))
          ]))
    ]));
const AssignedIssues = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'AssignedIssues'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'query')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'count')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'search'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'query'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'query'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'type'),
                value: _i1.EnumValueNode(name: _i1.NameNode(value: 'ISSUE'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'count')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'node'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'Issue'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: '__typename'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'repository'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(
                                            value: 'nameWithOwner'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'url'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'number'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'url'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'title'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'author'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'login'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'url'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'createdAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'closedAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'labels'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100'))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name: _i1.NameNode(value: 'name'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name:
                                                  _i1.NameNode(value: 'color'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ]))
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'comments'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'totalCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'assignees'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100'))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name: _i1.NameNode(
                                                  value: 'avatarUrl'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name: _i1.NameNode(value: 'name'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ]))
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'timelineItems'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100')),
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'itemTypes'),
                                        value: _i1.ListValueNode(values: [
                                          _i1.EnumValueNode(
                                              name: _i1.NameNode(
                                                  value:
                                                      'CROSS_REFERENCED_EVENT'))
                                        ]))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: _i1.SelectionSetNode(
                                            selections: [
                                              _i1.InlineFragmentNode(
                                                  typeCondition:
                                                      _i1.TypeConditionNode(
                                                          on: _i1.NamedTypeNode(
                                                              name: _i1.NameNode(
                                                                  value:
                                                                      'CrossReferencedEvent'),
                                                              isNonNull:
                                                                  false)),
                                                  directives: [],
                                                  selectionSet:
                                                      _i1.SelectionSetNode(
                                                          selections: [
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    '__typename'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null),
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    'isCrossRepository'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null),
                                                        _i1.FieldNode(
                                                            name: _i1.NameNode(
                                                                value:
                                                                    'source'),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: _i1
                                                                .SelectionSetNode(
                                                                    selections: [
                                                                  _i1.InlineFragmentNode(
                                                                      typeCondition: _i1.TypeConditionNode(on: _i1.NamedTypeNode(name: _i1.NameNode(value: 'PullRequest'), isNonNull: false)),
                                                                      directives: [],
                                                                      selectionSet: _i1.SelectionSetNode(selections: [
                                                                        _i1.FieldNode(
                                                                            name:
                                                                                _i1.NameNode(value: 'title'),
                                                                            alias: null,
                                                                            arguments: [],
                                                                            directives: [],
                                                                            selectionSet: null),
                                                                        _i1.FieldNode(
                                                                            name:
                                                                                _i1.NameNode(value: 'url'),
                                                                            alias: null,
                                                                            arguments: [],
                                                                            directives: [],
                                                                            selectionSet: null)
                                                                      ]))
                                                                ]))
                                                      ]))
                                            ])),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(
                                            value: 'filteredCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ]))
                            ]))
                      ]))
                ]))
          ]))
    ]));
const Repositories = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'Repositories'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'query')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'String'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'count')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Int'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: []),
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'historySince')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'GitTimestamp'), isNonNull: false),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'search'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'query'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'query'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'type'),
                value:
                    _i1.EnumValueNode(name: _i1.NameNode(value: 'REPOSITORY'))),
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'first'),
                value: _i1.VariableNode(name: _i1.NameNode(value: 'count')))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'repositoryCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FieldNode(
                name: _i1.NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'node'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.InlineFragmentNode(
                            typeCondition: _i1.TypeConditionNode(
                                on: _i1.NamedTypeNode(
                                    name: _i1.NameNode(value: 'Repository'),
                                    isNonNull: false)),
                            directives: [],
                            selectionSet: _i1.SelectionSetNode(selections: [
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: '__typename'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'name'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'description'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'isFork'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'isPrivate'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'viewerHasStarred'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name:
                                      _i1.NameNode(value: 'openGraphImageUrl'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'mirrorUrl'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'stargazers'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'totalCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'languages'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '1')),
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'orderBy'),
                                        value: _i1.ObjectValueNode(fields: [
                                          _i1.ObjectFieldNode(
                                              name:
                                                  _i1.NameNode(value: 'field'),
                                              value: _i1.EnumValueNode(
                                                  name: _i1.NameNode(
                                                      value: 'SIZE'))),
                                          _i1.ObjectFieldNode(
                                              name: _i1.NameNode(
                                                  value: 'direction'),
                                              value: _i1.EnumValueNode(
                                                  name: _i1.NameNode(
                                                      value: 'DESC')))
                                        ]))
                                  ],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'nodes'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name:
                                                  _i1.NameNode(value: 'color'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name: _i1.NameNode(value: 'name'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ]))
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'licenseInfo'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'name'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'forkCount'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'parent'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'name'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(
                                            value: 'nameWithOwner'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'owner'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet:
                                            _i1.SelectionSetNode(selections: [
                                          _i1.FieldNode(
                                              name:
                                                  _i1.NameNode(value: 'login'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null),
                                          _i1.FieldNode(
                                              name: _i1.NameNode(
                                                  value: 'avatarUrl'),
                                              alias: null,
                                              arguments: [],
                                              directives: [],
                                              selectionSet: null)
                                        ])),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'forkCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'url'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'issues'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'totalCount'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'owner'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet:
                                      _i1.SelectionSetNode(selections: [
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'login'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null),
                                    _i1.FieldNode(
                                        name: _i1.NameNode(value: 'avatarUrl'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null)
                                  ])),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'updatedAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'pushedAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'createdAt'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'name'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'nameWithOwner'),
                                  alias: null,
                                  arguments: [],
                                  directives: [],
                                  selectionSet: null),
                              _i1.FieldNode(
                                  name: _i1.NameNode(value: 'refs'),
                                  alias: null,
                                  arguments: [
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'refPrefix'),
                                        value: _i1.StringValueNode(
                                            value: 'refs/heads/',
                                            isBlock: false)),
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'first'),
                                        value: _i1.IntValueNode(value: '100')),
                                    _i1.ArgumentNode(
                                        name: _i1.NameNode(value: 'orderBy'),
                                        value: _i1.ObjectValueNode(fields: [
                                          _i1.ObjectFieldNode(
                                              name:
                                                  _i1.NameNode(value: 'field'),
                                              value: _i1.EnumValueNode(
                                                  name: _i1.NameNode(
                                                      value:
                                                          'TAG_COMMIT_DATE'))),
                                          _i1.ObjectFieldNode(
                                              name: _i1.NameNode(
                                                  value: 'direction'),
                                              value: _i1.EnumValueNode(
                                                  name: _i1.NameNode(
                                                      value: 'DESC')))
                                        ]))
                                  ],
                                  directives: [],
                                  selectionSet: _i1.SelectionSetNode(
                                      selections: [
                                        _i1.FieldNode(
                                            name: _i1.NameNode(value: 'nodes'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: _i1.SelectionSetNode(
                                                selections: [
                                                  _i1.FieldNode(
                                                      name: _i1.NameNode(
                                                          value: 'target'),
                                                      alias: null,
                                                      arguments: [],
                                                      directives: [],
                                                      selectionSet:
                                                          _i1.SelectionSetNode(
                                                              selections: [
                                                            _i1
                                                                .InlineFragmentNode(
                                                                    typeCondition: _i1.TypeConditionNode(
                                                                        on: _i1.NamedTypeNode(
                                                                            name: _i1.NameNode(
                                                                                value:
                                                                                    'Commit'),
                                                                            isNonNull:
                                                                                false)),
                                                                    directives: [],
                                                                    selectionSet:
                                                                        _i1.SelectionSetNode(
                                                                            selections: [
                                                                          _i1.FieldNode(
                                                                              name: _i1.NameNode(value: '__typename'),
                                                                              alias: null,
                                                                              arguments: [],
                                                                              directives: [],
                                                                              selectionSet: null),
                                                                          _i1.FieldNode(
                                                                              name: _i1.NameNode(value: 'history'),
                                                                              alias: null,
                                                                              arguments: [
                                                                                _i1.ArgumentNode(name: _i1.NameNode(value: 'since'), value: _i1.VariableNode(name: _i1.NameNode(value: 'historySince')))
                                                                              ],
                                                                              directives: [],
                                                                              selectionSet: _i1.SelectionSetNode(selections: [
                                                                                _i1.FieldNode(
                                                                                    name: _i1.NameNode(value: 'edges'),
                                                                                    alias: null,
                                                                                    arguments: [],
                                                                                    directives: [],
                                                                                    selectionSet: _i1.SelectionSetNode(selections: [
                                                                                      _i1.FieldNode(
                                                                                          name: _i1.NameNode(value: 'node'),
                                                                                          alias: null,
                                                                                          arguments: [],
                                                                                          directives: [],
                                                                                          selectionSet: _i1.SelectionSetNode(selections: [
                                                                                            _i1.FieldNode(name: _i1.NameNode(value: 'message'), alias: null, arguments: [], directives: [], selectionSet: null),
                                                                                            _i1.FieldNode(name: _i1.NameNode(value: 'committedDate'), alias: null, arguments: [], directives: [], selectionSet: null)
                                                                                          ]))
                                                                                    ]))
                                                                              ]))
                                                                        ]))
                                                          ]))
                                                ]))
                                      ]))
                            ]))
                      ]))
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [
  ViewerDetail,
  AssignedPullRequests,
  AssignedIssues,
  Repositories
]);
