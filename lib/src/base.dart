import 'unist.dart';
import 'converter.dart';

/// A container can contain directly any other [Element] or [GreaterElement]
/// except:
// - elements of their own type,
// - node properties, which can only be found in property drawers,
// - items, which can only be found in plain lists.
abstract class GreaterElement extends Parent implements SerializableOrgNode {
  abstract final int contentsBegin;
  abstract final int contentsEnd;
}

abstract class Element extends Parent implements SerializableOrgNode {
  abstract final int? contentsBegin;
  abstract final int? contentsEnd;
}

abstract class RecursiveObject extends Node implements SerializableOrgNode {
  abstract final int? contentsBegin;
  abstract final int? contentsEnd;
  abstract final List<dynamic> children;
}

class OrgNodeTpl {
  Data? data;
  Position? position;
}

class GreaterElementMeta extends OrgNodeTpl {
  final int contentsBegin;
  final int contentsEnd;
  GreaterElementMeta(this.contentsBegin, this.contentsEnd);
}

class OrgElementTpl {
  final Data? data = null;
  final Position? position = null;
  final int? contentsBegin;
  final int? contentsEnd;

  OrgElementTpl(this.contentsBegin, this.contentsEnd);
}

class OrgObjectTpl {
  Data? data;
  Position? position;
  final int? contentsBegin;
  final int? contentsEnd;
  OrgObjectTpl(this.contentsBegin, this.contentsEnd);
}
