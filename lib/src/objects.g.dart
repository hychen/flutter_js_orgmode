// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgTableCell _$OrgTableCellFromJson(Map<String, dynamic> json) => OrgTableCell(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgTableCellToJson(OrgTableCell instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgBold _$OrgBoldFromJson(Map<String, dynamic> json) => OrgBold(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgBoldToJson(OrgBold instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgItalic _$OrgItalicFromJson(Map<String, dynamic> json) => OrgItalic(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgItalicToJson(OrgItalic instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgCode _$OrgCodeFromJson(Map<String, dynamic> json) => OrgCode(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgCodeToJson(OrgCode instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
    };

OrgVerbatim _$OrgVerbatimFromJson(Map<String, dynamic> json) => OrgVerbatim(
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgVerbatimToJson(OrgVerbatim instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
    };

OrgStrikeThrough _$OrgStrikeThroughFromJson(Map<String, dynamic> json) =>
    OrgStrikeThrough(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgStrikeThroughToJson(OrgStrikeThrough instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgUnderline _$OrgUnderlineFromJson(Map<String, dynamic> json) => OrgUnderline(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgUnderlineToJson(OrgUnderline instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgSuperscript _$OrgSuperscriptFromJson(Map<String, dynamic> json) =>
    OrgSuperscript(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgSuperscriptToJson(OrgSuperscript instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgSubscript _$OrgSubscriptFromJson(Map<String, dynamic> json) => OrgSubscript(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgSubscriptToJson(OrgSubscript instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgLink _$OrgLinkFromJson(Map<String, dynamic> json) => OrgLink(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      format: $enumDecode(_$OrgLinkFormatEnumMap, json['format']),
      linkType: json['linkType'] as String,
      rawLink: json['rawLink'] as String,
      path: json['path'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgLinkToJson(OrgLink instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'format': _$OrgLinkFormatEnumMap[instance.format],
      'linkType': instance.linkType,
      'rawLink': instance.rawLink,
      'path': instance.path,
    };

const _$OrgLinkFormatEnumMap = {
  OrgLinkFormat.plain: 'plain',
  OrgLinkFormat.bracket: 'bracket',
  OrgLinkFormat.angel: 'angel',
};

OrgText _$OrgTextFromJson(Map<String, dynamic> json) => OrgText(
      value: json['value'],
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgTextToJson(OrgText instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
    };

OrgTimestamp _$OrgTimestampFromJson(Map<String, dynamic> json) => OrgTimestamp(
      timestampType:
          $enumDecode(_$OrgTimestampTypeEnumMap, json['timestampType']),
      rawString: json['rawString'] as String,
      start: json['start'] == null
          ? null
          : OrgDuration.fromJson(json['start'] as Map<String, dynamic>),
      end: json['end'] == null
          ? null
          : OrgDuration.fromJson(json['end'] as Map<String, dynamic>),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgTimestampToJson(OrgTimestamp instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'timestampType': _$OrgTimestampTypeEnumMap[instance.timestampType],
      'rawString': instance.rawString,
      'start': instance.start?.toJson(),
      'end': instance.end?.toJson(),
    };

const _$OrgTimestampTypeEnumMap = {
  OrgTimestampType.active: 'active',
  OrgTimestampType.activeRange: 'active-range',
  OrgTimestampType.diary: 'diary',
  OrgTimestampType.inactive: 'inactive',
  OrgTimestampType.inactiveRange: 'inactive-range',
};

OrgDuration _$OrgDurationFromJson(Map<String, dynamic> json) => OrgDuration(
      year: json['year'] as int,
      month: json['month'] as int,
      day: json['day'] as int,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
    );

Map<String, dynamic> _$OrgDurationToJson(OrgDuration instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
    };

OrgFootnoteReference _$OrgFootnoteReferenceFromJson(
        Map<String, dynamic> json) =>
    OrgFootnoteReference(
      contentsBegin: json['contentsBegin'] as int?,
      contentsEnd: json['contentsEnd'] as int?,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String,
      footnoteType: $enumDecode(_$OrgFootnoteTypeEnumMap, json['footnoteType']),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgFootnoteReferenceToJson(
        OrgFootnoteReference instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'label': instance.label,
      'footnoteType': _$OrgFootnoteTypeEnumMap[instance.footnoteType],
    };

const _$OrgFootnoteTypeEnumMap = {
  OrgFootnoteType.inline: 'inline',
  OrgFootnoteType.standard: 'standard',
  OrgFootnoteType.anonymous: 'anonymous',
};

OrgLatexFragment _$OrgLatexFragmentFromJson(Map<String, dynamic> json) =>
    OrgLatexFragment(
      value: json['value'] as String,
      contents: json['contents'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgLatexFragmentToJson(OrgLatexFragment instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'value': instance.value,
      'contents': instance.contents,
    };

OrgEntity _$OrgEntityFromJson(Map<String, dynamic> json) => OrgEntity(
      name: json['name'] as String,
      useBrackets: json['useBrackets'] as bool,
      latex: json['latex'] as String,
      requireLatexMath: json['requireLatexMath'] as bool,
      html: json['html'] as String,
      ascii: json['ascii'] as String,
      latin1: json['latin1'] as String,
      utf8: json['utf8'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgEntityToJson(OrgEntity instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'name': instance.name,
      'useBrackets': instance.useBrackets,
      'latex': instance.latex,
      'requireLatexMath': instance.requireLatexMath,
      'html': instance.html,
      'ascii': instance.ascii,
      'latin1': instance.latin1,
      'utf8': instance.utf8,
    };
