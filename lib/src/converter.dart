library converter;

import 'package:json_annotation/json_annotation.dart';
import 'greater_elements.dart';
import 'elements.dart';
import 'objects.dart';

abstract class SerializableOrgNode {
  Map<String, dynamic> toJson();
}
// @FIXME: should add type constraint.
class NodeListConverter implements JsonConverter<dynamic, Map<String, dynamic>> {
  const NodeListConverter();

  @override
  fromJson(json) {
    if(greaterElementType.contains(json['type'])) {
      return greaterElementTypeFromJson(json);
    } else if (elementType.contains(json['type'])) {
      return elementTypeFromJson(json);
    } else if(objectType.contains(json['type'])) {
      return objectTypeFromJson(json);
    } else {
      throw UnimplementedError(json['type']);
    }
  }

  @override
  toJson(Object? object) => (object as SerializableOrgNode).toJson();
}
