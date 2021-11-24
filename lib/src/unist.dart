/// Syntax Tree Types
///
/// This file contains interfaces specified by [unist](https://github.com/syntax-tree/unist)
/// 2.0.0.
library unist;

import 'package:json_annotation/json_annotation.dart';

part 'unist.g.dart';

/// The Nodes containing other nodes.
abstract class Parent extends Node {
  /// A list representing the children of a [Node].
  abstract final List children;
}

/// Nodes containing a value.
abstract class Literal extends Node {
  /// Any value.
  abstract final dynamic value;
}

// Syntactic units in unist syntax trees are called nodes,
// and implement the Node interface.
abstract class Node {
  /// A representation of the variant of a node.
  abstract final String type;

  /// The information from the ecosystem.
  abstract final Data? data;

  /// The location of a node in a source document.
  abstract final Position? position;
}

@JsonSerializable()

/// The location of a node in a source file.
class Position {
  /// The first character of the parsed source region.
  final Point start;

  /// The end field of Position represents the place of the first character
  /// after the parsed source region, whether it exists or not.
  final Point end;

  /// The start column at each index (plus start line) in the source region,
  /// for elements that span multiple lines.
  final List<int>? indent;

  Position(this.start, this.end, this.indent);
  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}

@JsonSerializable()

/// One place in a source file.
class Point {
  /// (1-indexed integer) represents a line in a source file.
  final int line;

  /// (1-indexed integer) represents a column in a source file
  final int column;

  /// (0-indexed integer) represents a character in a source file.
  final int? offset;

  Point(this.line, this.column, this.offset);
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}

/// The information associated by the ecosystem with the node.
/// This space is guaranteed to never be specified by unist or
/// specifications implementing unist.
typedef Data = Object;
