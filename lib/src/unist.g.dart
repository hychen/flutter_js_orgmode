// GENERATED CODE - DO NOT MODIFY BY HAND

part of unist;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      Point.fromJson(json['start'] as Map<String, dynamic>),
      Point.fromJson(json['end'] as Map<String, dynamic>),
      (json['indent'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'start': instance.start.toJson(),
      'end': instance.end.toJson(),
      'indent': instance.indent,
    };

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      json['line'] as int,
      json['column'] as int,
      json['offset'] as int?,
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'line': instance.line,
      'column': instance.column,
      'offset': instance.offset,
    };
