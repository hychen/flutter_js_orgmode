// GENERATED CODE - DO NOT MODIFY BY HAND

part of elements;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgHeadline _$OrgHeadlineFromJson(Map<String, dynamic> json) => OrgHeadline(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      level: json['level'] as int,
      todoKeyword: json['todoKeyword'] as String?,
      priority: json['priority'] as String?,
      commented: json['commented'] as bool,
      rawValue: json['rawValue'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OrgHeadlineToJson(OrgHeadline instance) =>
    <String, dynamic>{
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'level': instance.level,
      'todoKeyword': instance.todoKeyword,
      'priority': instance.priority,
      'commented': instance.commented,
      'rawValue': instance.rawValue,
      'tags': instance.tags,
    };

OrgPlanning _$OrgPlanningFromJson(Map<String, dynamic> json) => OrgPlanning(
      closed: json['closed'] == null
          ? null
          : OrgTimestamp.fromJson(json['closed'] as Map<String, dynamic>),
      deadline: json['deadline'] == null
          ? null
          : OrgTimestamp.fromJson(json['deadline'] as Map<String, dynamic>),
      scheduled: json['scheduled'] == null
          ? null
          : OrgTimestamp.fromJson(json['scheduled'] as Map<String, dynamic>),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgPlanningToJson(OrgPlanning instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'closed': instance.closed?.toJson(),
      'deadline': instance.deadline?.toJson(),
      'scheduled': instance.scheduled?.toJson(),
    };

OrgNodeProperty _$OrgNodePropertyFromJson(Map<String, dynamic> json) =>
    OrgNodeProperty(
      key: json['key'] as String,
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgNodePropertyToJson(OrgNodeProperty instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'key': instance.key,
      'value': instance.value,
    };

OrgListItemTag _$OrgListItemTagFromJson(Map<String, dynamic> json) =>
    OrgListItemTag(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrgListItemTagToJson(OrgListItemTag instance) =>
    <String, dynamic>{
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgCommentBlock _$OrgCommentBlockFromJson(Map<String, dynamic> json) =>
    OrgCommentBlock(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgCommentBlockToJson(OrgCommentBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'value': instance.value,
    };

OrgSrcBlock _$OrgSrcBlockFromJson(Map<String, dynamic> json) => OrgSrcBlock(
      language: json['language'] as String?,
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgSrcBlockToJson(OrgSrcBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'language': instance.language,
      'value': instance.value,
    };

OrgExampleBlock _$OrgExampleBlockFromJson(Map<String, dynamic> json) =>
    OrgExampleBlock(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgExampleBlockToJson(OrgExampleBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'value': instance.value,
    };

OrgExportBlock _$OrgExportBlockFromJson(Map<String, dynamic> json) =>
    OrgExportBlock(
      backend: json['backend'] as String?,
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgExportBlockToJson(OrgExportBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'backend': instance.backend,
      'value': instance.value,
    };

OrgKeyword _$OrgKeywordFromJson(Map<String, dynamic> json) => OrgKeyword(
      key: json['key'] as String,
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgKeywordToJson(OrgKeyword instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'key': instance.key,
      'value': instance.value,
    };

OrgTableRow _$OrgTableRowFromJson(Map<String, dynamic> json) => OrgTableRow(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) => OrgTableCell.fromJson(e as Map<String, dynamic>))
          .toList(),
      rowType: $enumDecode(_$OrgRowTypeEnumMap, json['rowType']),
    );

Map<String, dynamic> _$OrgTableRowToJson(OrgTableRow instance) =>
    <String, dynamic>{
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'rowType': _$OrgRowTypeEnumMap[instance.rowType],
    };

const _$OrgRowTypeEnumMap = {
  OrgRowType.standard: 'standard',
  OrgRowType.rule: 'rule',
};

OrgComment _$OrgCommentFromJson(Map<String, dynamic> json) => OrgComment(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgCommentToJson(OrgComment instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
    };

OrgFixedWith _$OrgFixedWithFromJson(Map<String, dynamic> json) => OrgFixedWith(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgFixedWithToJson(OrgFixedWith instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
    };

OrgClock _$OrgClockFromJson(Map<String, dynamic> json) => OrgClock(
      duration: json['duration'] as String?,
      status: $enumDecode(_$OrgClockStatusEnumMap, json['status']),
      value: json['value'] == null
          ? null
          : OrgTimestamp.fromJson(json['value'] as Map<String, dynamic>),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..type = json['type'] as String;

Map<String, dynamic> _$OrgClockToJson(OrgClock instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'type': instance.type,
      'duration': instance.duration,
      'status': _$OrgClockStatusEnumMap[instance.status],
      'value': instance.value?.toJson(),
    };

const _$OrgClockStatusEnumMap = {
  OrgClockStatus.closed: 'closed',
  OrgClockStatus.running: 'running',
};

OrgLatexEnvironment _$OrgLatexEnvironmentFromJson(Map<String, dynamic> json) =>
    OrgLatexEnvironment(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgLatexEnvironmentToJson(
        OrgLatexEnvironment instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'value': instance.value,
    };

OrgHorizontalRule _$OrgHorizontalRuleFromJson(Map<String, dynamic> json) =>
    OrgHorizontalRule()
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgHorizontalRuleToJson(OrgHorizontalRule instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
    };

OrgDiarySexp _$OrgDiarySexpFromJson(Map<String, dynamic> json) => OrgDiarySexp(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgDiarySexpToJson(OrgDiarySexp instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'affiliated': instance.affiliated,
      'value': instance.value,
    };

OrgParagraph _$OrgParagraphFromJson(Map<String, dynamic> json) => OrgParagraph(
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgParagraphToJson(OrgParagraph instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };
