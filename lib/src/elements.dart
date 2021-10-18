/// This library implements models used in "Element" environments
/// described in org-mode syntax spec.
library elements;

import 'package:json_annotation/json_annotation.dart';
import 'unist.dart';
import 'base.dart';
import 'objects.dart';
import 'converter.dart';

part 'elements.g.dart';

const elementType = [
  'headline',
  'planning',
  'node-property',
  'list-item-tag',
  'comment-block',
  'src-block',
  'example-block',
  'export-block',
  'keyword',
  'table-row',
  'comment',
  'fixed-width',
  'clock',
  'latex-environment',
  'horizontal-rule',
  'diary-sexp',
  'paragraph'
];

elementTypeFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'headline':
      return OrgHeadline.fromJson(json);
    case 'planning':
      return OrgPlanning.fromJson(json);
    case 'node-property':
      return OrgNodeProperty.fromJson(json);
    case 'list-item-tag':
      return OrgListItemTag.fromJson(json);
    case 'comment-block':
      return OrgCommentBlock.fromJson(json);
    case 'src-block':
      return OrgSrcBlock.fromJson(json);
    case 'example-block':
      return OrgExampleBlock.fromJson(json);
    case 'export-block':
      return OrgExportBlock.fromJson(json);
    case 'keyword':
      return OrgKeyword.fromJson(json);
    case 'table-row':
      return OrgTableRow.fromJson(json);
    case 'comment':
      return OrgComment.fromJson(json);
    case 'fixed-width':
      return OrgFixedWith.fromJson(json);
    case 'clock':
      return OrgClock.fromJson(json);
    case 'latex-environment':
      return OrgLatexEnvironment.fromJson(json);
    case 'horizontal-rule':
      return OrgHorizontalRule.fromJson(json);
    case 'diary-sexp':
      return OrgDiarySexp.fromJson(json);
    case 'paragraph':
      return OrgParagraph.fromJson(json);
    default:
      throw ArgumentError('is not a valid ElementType', 'json');
  }
}

/// A line defined as STARS KEYWORD PRIORITY TITLE TAGS.
@JsonSerializable()
class OrgHeadline extends OrgElementTpl implements Element {
  @override
  final String type = 'headline';

  /// A list contains [OrgText] or [OrgLink] which
  /// is a representation of the title of the headline.
  @override
  @NodeListConverter()
  final List children;

  /// The indent level.
  final int level;

  /// A keyword.
  final String? todoKeyword;

  /// A single letter.
  final String? priority;

  /// the value is true if the HEADLINE has COMMENT tag.
  final bool commented;

  final String rawValue;

  /// Words containing any alpha-numeric character, underscore, at sign,
  /// hash sign or percent sign.
  final List<String> tags;

  OrgHeadline({
    int? contentsBegin,
    int? contentsEnd,
    required this.children,
    required this.level,
    this.todoKeyword,
    this.priority,
    required this.commented,
    required this.rawValue,
    required this.tags,
  })  : assert(level >= 0),
        super(contentsBegin, contentsEnd);
  factory OrgHeadline.fromJson(Map<String, dynamic> json) =>
      _$OrgHeadlineFromJson(json);
  Map<String, dynamic> toJson() => _$OrgHeadlineToJson(this);
}

/// A line filled with INFO parts, where each of them follows the patter:
///
/// ```
/// KEYWORD: TIMESTAMP
/// ```
@JsonSerializable()
class OrgPlanning extends OrgNodeTpl implements Node {
  @override
  final String type = 'planning';

  final OrgTimestamp? closed;

  final OrgTimestamp? deadline;

  final OrgTimestamp? scheduled;

  OrgPlanning({this.closed, this.deadline, this.scheduled});

  factory OrgPlanning.fromJson(Map<String, dynamic> json) =>
      _$OrgPlanningFromJson(json);
  Map<String, dynamic> toJson() => _$OrgPlanningToJson(this);
}

/// A key-value pair included in a [PropertyDrawer].
///
/// ```
/// #+PROPERTIES
/// #:KEY: 1
/// #+END
/// ```
@JsonSerializable()
class OrgNodeProperty extends OrgNodeTpl implements Node {
  @override
  final String type = 'node-property';

  /// The key of the property.
  final String key;

  /// The value of the property.
  final String value;

  OrgNodeProperty({required this.key, required this.value});

  factory OrgNodeProperty.fromJson(Map<String, dynamic> json) =>
      _$OrgNodePropertyFromJson(json);
  Map<String, dynamic> toJson() => _$OrgNodePropertyToJson(this);
}

/// TAG follows “TAG-TEXT ::” pattern, where TAG-TEXT can contain any
/// character but a new line.
@JsonSerializable()
class OrgListItemTag extends OrgElementTpl implements Element {
  @override
  final String type = 'list-item-tag';

  @override
  @NodeListConverter()
  final List children;

  OrgListItemTag({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgListItemTag.fromJson(Map<String, dynamic> json) =>
      _$OrgListItemTagFromJson(json);
  Map<String, dynamic> toJson() => _$OrgListItemTagToJson(this);
}

/// ```
/// #+BEGIN_COMMENT
/// CONTENTS
/// #+END_COMMENT
/// ```
@JsonSerializable()
class OrgCommentBlock extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'comment-block';
  final String value;

  OrgCommentBlock({required this.value});
  factory OrgCommentBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgCommentBlockFromJson(json);
  Map<String, dynamic> toJson() => _$OrgCommentBlockToJson(this);
}

/// ```
/// #+BEGIN_SRC
/// CONTENTS
/// #+END_SRC
@JsonSerializable()
class OrgSrcBlock extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'src-block';

  /// the programming language.
  final String? language;

  /// the body.
  final String value;

  OrgSrcBlock({this.language, required this.value});

  factory OrgSrcBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgSrcBlockFromJson(json);
  Map<String, dynamic> toJson() => _$OrgSrcBlockToJson(this);
}

/// ```
/// #+BEGIN_EXAMPLE
/// CONTENTS
/// #+END_EXAMPLE
/// ```
@JsonSerializable()
class OrgExampleBlock extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'example-block';

  final String value;

  OrgExampleBlock({required this.value});
  factory OrgExampleBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgExampleBlockFromJson(json);
  Map<String, dynamic> toJson() => _$OrgExampleBlockToJson(this);
}

/// ```
/// @FIXME: figure out what this class for?
///
/// #+BEGIN_EXPORT
/// CONTENTS
/// #+END_EXPORT
/// ```
@JsonSerializable()
class OrgExportBlock extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'export-block';

  final String? backend;

  final String value;

  OrgExportBlock({this.backend, required this.value});
  factory OrgExportBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgExportBlockFromJson(json);
  Map<String, dynamic> toJson() => _$OrgExportBlockToJson(this);
}

/// Per file keyword.
/// ```
/// #+TITLE: title
/// ```
@JsonSerializable()
class OrgKeyword extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'keyword';

  /// the key of the keyword.
  final String key;

  /// the value of the keyword.
  final String value;

  OrgKeyword({required this.key, required this.value});

  factory OrgKeyword.fromJson(Map<String, dynamic> json) =>
      _$OrgKeywordFromJson(json);
  Map<String, dynamic> toJson() => _$OrgKeywordToJson(this);
}

/// A table rows is either constituted of a vertical bar and any number of
/// table cells or a vertical bar followed by a hyphen.
@JsonSerializable()
class OrgTableRow extends OrgElementTpl implements Element {
  @override
  final String type = 'table-row';

  @override
  List<OrgTableCell> children;

  /// In the first case the table row has the “standard” type.
  /// In the second case, it has the “rule” type.
  final OrgRowType rowType;

  OrgTableRow({
    int? contentsBegin,
    int? contentsEnd,
    required this.children,
    required this.rowType,
  }) : super(contentsBegin, contentsEnd);

  factory OrgTableRow.fromJson(Map<String, dynamic> json) =>
      _$OrgTableRowFromJson(json);
  Map<String, dynamic> toJson() => _$OrgTableRowToJson(this);
}

@JsonEnum(fieldRename: FieldRename.kebab)
enum OrgRowType { standard, rule }

@JsonSerializable()
class OrgComment extends OrgNodeTpl implements Node {
  @override
  final String type = 'comment';

  /// Comments, without pound signs.
  final String value;

  OrgComment({required this.value});

  factory OrgComment.fromJson(Map<String, dynamic> json) =>
      _$OrgCommentFromJson(json);
  Map<String, dynamic> toJson() => _$OrgCommentToJson(this);
}

/// A “fixed-width line” start with a colon character and a whitespace or
/// an end of line.
@JsonSerializable()
class OrgFixedWith extends OrgNodeTpl implements Node {
  @override
  final String type = 'fixed-width';

  /// Comments, without pound signs.
  final String value;

  OrgFixedWith({required this.value});

  factory OrgFixedWith.fromJson(Map<String, dynamic> json) =>
      _$OrgFixedWithFromJson(json);
  Map<String, dynamic> toJson() => _$OrgFixedWithToJson(this);
}

@JsonSerializable()
class OrgClock extends OrgNodeTpl implements Node {
  @override
  String type = 'clock';

  final String? duration;

  final OrgClockStatus status;

  final OrgTimestamp? value;

  OrgClock({this.duration, required this.status, this.value});

  factory OrgClock.fromJson(Map<String, dynamic> json) =>
      _$OrgClockFromJson(json);
  Map<String, dynamic> toJson() => _$OrgClockToJson(this);
}

@JsonEnum()
enum OrgClockStatus { closed, running }

/// Latex environment.
///
/// ```
/// \begin{NAME} CONTENTS \end{NAME}
/// ```
@JsonSerializable()
class OrgLatexEnvironment extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'latex-environment';

  /// LaTeX code.
  final String value;

  OrgLatexEnvironment({required this.value});
  factory OrgLatexEnvironment.fromJson(Map<String, dynamic> json) =>
      _$OrgLatexEnvironmentFromJson(json);
  Map<String, dynamic> toJson() => _$OrgLatexEnvironmentToJson(this);
}

/// A horizontal rule is a line made of at least 5 consecutive hyphens.
/// It can be indented.
@JsonSerializable()
class OrgHorizontalRule extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'horizontal-rule';

  OrgHorizontalRule();

  factory OrgHorizontalRule.fromJson(Map<String, dynamic> json) =>
      _$OrgHorizontalRuleFromJson(json);
  Map<String, dynamic> toJson() => _$OrgHorizontalRuleToJson(this);
}

/// The representation fo a line starting at column 0 with “%%(” string.
/// It can then contain any character besides a new line.
@JsonSerializable()
class OrgDiarySexp extends OrgNodeTpl
    with WithAffiliatedKeywords
    implements Node {
  @override
  final String type = 'diary-sexp';

  /// Full Sexp
  final String value;

  OrgDiarySexp({required this.value});
  factory OrgDiarySexp.fromJson(Map<String, dynamic> json) =>
      _$OrgDiarySexpFromJson(json);
  Map<String, dynamic> toJson() => _$OrgDiarySexpToJson(this);
}

/// Any unrecognized context.
@JsonSerializable()
class OrgParagraph extends OrgNodeTpl implements Parent {
  @override
  final String type = 'paragraph';

  @override
  @NodeListConverter()
  final List children;

  OrgParagraph({required this.children});

  factory OrgParagraph.fromJson(Map<String, dynamic> json) =>
      _$OrgParagraphFromJson(json);
  Map<String, dynamic> toJson() => _$OrgParagraphToJson(this);
}

/// With the exception of comment, clocks, headlines, inlinetasks,
/// items, node properties, planning, property drawers, sections, and
/// table rows, every other element type can be assigned attributes.
///
/// It follows the following three patters:
///
/// ```
/// #+KEY: VALUE
/// #+KEY[OPTIONAL]: VALUE
/// #+ATTR_BACKEND: VALUE
/// ```
abstract class WithAffiliatedKeywords {
  dynamic affiliated;
}
