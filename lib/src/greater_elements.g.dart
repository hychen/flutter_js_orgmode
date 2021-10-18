// GENERATED CODE - DO NOT MODIFY BY HAND

part of greater_element;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgData _$OrgDataFromJson(Map<String, dynamic> json) => OrgData(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgDataToJson(OrgData instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgSection _$OrgSectionFromJson(Map<String, dynamic> json) => OrgSection(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgSectionToJson(OrgSection instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgDrawer _$OrgDrawerFromJson(Map<String, dynamic> json) => OrgDrawer(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: json['children'] as List<dynamic>,
      name: json['name'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgDrawerToJson(OrgDrawer instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'children': instance.children,
      'name': instance.name,
    };

OrgPropertyDrawer _$OrgPropertyDrawerFromJson(Map<String, dynamic> json) =>
    OrgPropertyDrawer(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) => OrgNodeProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgPropertyDrawerToJson(OrgPropertyDrawer instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children': instance.children.map((e) => e.toJson()).toList(),
    };

OrgList _$OrgListFromJson(Map<String, dynamic> json) => OrgList(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) => OrgListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      indent: json['indent'] as int,
      listType: $enumDecode(_$OrgListTypeEnumMap, json['listType']),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgListToJson(OrgList instance) => <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'indent': instance.indent,
      'listType': _$OrgListTypeEnumMap[instance.listType],
    };

const _$OrgListTypeEnumMap = {
  OrgListType.ordered: 'ordered',
  OrgListType.unordered: 'unordered',
  OrgListType.descriptive: 'descriptive',
};

OrgListItem _$OrgListItemFromJson(Map<String, dynamic> json) => OrgListItem(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      indent: json['indent'] as int,
      bullet: json['bullet'] as String,
      counter: json['counter'] as String?,
      checkbox: $enumDecodeNullable(_$OrgCheckboxTypeEnumMap, json['checkbox']),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgListItemToJson(OrgListItem instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'indent': instance.indent,
      'bullet': instance.bullet,
      'counter': instance.counter,
      'checkbox': _$OrgCheckboxTypeEnumMap[instance.checkbox],
    };

const _$OrgCheckboxTypeEnumMap = {
  OrgCheckboxType.on: 'on',
  OrgCheckboxType.off: 'off',
  OrgCheckboxType.trans: 'trans',
};

OrgQuoteBlock _$OrgQuoteBlockFromJson(Map<String, dynamic> json) =>
    OrgQuoteBlock(
      contentsBegin: json['contentsBegin'],
      contentsEnd: json['contentsEnd'],
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated']
      ..type = json['type'] as String;

Map<String, dynamic> _$OrgQuoteBlockToJson(OrgQuoteBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'type': instance.type,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgVerseBlock _$OrgVerseBlockFromJson(Map<String, dynamic> json) =>
    OrgVerseBlock(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgVerseBlockToJson(OrgVerseBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgCenterBlock _$OrgCenterBlockFromJson(Map<String, dynamic> json) =>
    OrgCenterBlock(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgCenterBlockToJson(OrgCenterBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
    };

OrgSpecialBlock _$OrgSpecialBlockFromJson(Map<String, dynamic> json) =>
    OrgSpecialBlock(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      blockType: json['blockType'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgSpecialBlockToJson(OrgSpecialBlock instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'blockType': instance.blockType,
    };

OrgFootnoteDefinition _$OrgFootnoteDefinitionFromJson(
        Map<String, dynamic> json) =>
    OrgFootnoteDefinition(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) =>
              const NodeListConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>)
      ..affiliated = json['affiliated'];

Map<String, dynamic> _$OrgFootnoteDefinitionToJson(
        OrgFootnoteDefinition instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'affiliated': instance.affiliated,
      'children':
          instance.children.map(const NodeListConverter().toJson).toList(),
      'label': instance.label,
    };

OrgTableOrg _$OrgTableOrgFromJson(Map<String, dynamic> json) => OrgTableOrg(
      contentsBegin: json['contentsBegin'] as int,
      contentsEnd: json['contentsEnd'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) => OrgTableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      tblfm: json['tblfm'] as String?,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgTableOrgToJson(OrgTableOrg instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'contentsBegin': instance.contentsBegin,
      'contentsEnd': instance.contentsEnd,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'tblfm': instance.tblfm,
    };

OrgTableEl _$OrgTableElFromJson(Map<String, dynamic> json) => OrgTableEl(
      tblfm: json['tblfm'] as String?,
      value: json['value'] as String,
    )
      ..data = json['data']
      ..position = json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>);

Map<String, dynamic> _$OrgTableElToJson(OrgTableEl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'position': instance.position?.toJson(),
      'tblfm': instance.tblfm,
      'value': instance.value,
    };
