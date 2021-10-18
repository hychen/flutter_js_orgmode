/// This library implements models used in "Object" environments
/// described in org-mode syntax spec.
library objects;

import 'package:json_annotation/json_annotation.dart';

import 'converter.dart';
import '../../src/unist.dart';
import '../../src/base.dart';

part 'objects.g.dart';

const objectType = [
  'link',
  'bold',
  'italic',
  'code',
  'verbatim',
  'strike-through',
  'underline',
  'superscript',
  'subscript',
  'text',
  'timestamp',
  'footnote-reference',
  'latex-fragment',
  'entity',
  'table-cell'
];

objectTypeFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'link':
      return OrgLink.fromJson(json);
    case 'bold':
      return OrgBold.fromJson(json);
    case 'italic':
      return OrgItalic.fromJson(json);
    case 'code':
      return OrgCode.fromJson(json);
    case 'verbatim':
      return OrgVerbatim.fromJson(json);
    case 'strike-through':
      return OrgStrikeThrough.fromJson(json);
    case 'underline':
      return OrgUnderline.fromJson(json);
    case 'superscript':
      return OrgSuperscript.fromJson(json);
    case 'subscript':
      return OrgSubscript.fromJson(json);
    case 'text':
      return OrgText.fromJson(json);
    case 'timestamp':
      return OrgTimestamp.fromJson(json);
    case 'footnote-reference':
      return OrgFootnoteReference.fromJson(json);
    case 'latex-fragment':
      return OrgLatexFragment.fromJson(json);
    case 'entity':
      return OrgEntity.fromJson(json);
    case 'table-cell':
      return OrgTableCell.fromJson(json);
    default:
      throw ArgumentError(json['type'] + ' is not valid ObjectTpe.', 'json');
  }
}

/// A cell element used in [OrgTableOrg] or [OrgTableEl].
///
/// follows the pattern:
//
/// ```
// CONTENTS SPACES|
/// ```
@JsonSerializable()
class OrgTableCell extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'table-cell';

  @override
  @NodeListConverter()
  List children;

  OrgTableCell({
    int? contentsBegin,
    int? contentsEnd,
    required this.children,
  }) : super(contentsBegin, contentsEnd);

  factory OrgTableCell.fromJson(Map<String, dynamic> json) =>
      _$OrgTableCellFromJson(json);
  Map<String, dynamic> toJson() => _$OrgTableCellToJson(this);
}

/// Bold Markup.
///
/// ```
/// *bold*
/// ```
@JsonSerializable()
class OrgBold extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'bold';

  @override
  @NodeListConverter()
  final List children;

  OrgBold({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgBold.fromJson(Map<String, dynamic> json) =>
      _$OrgBoldFromJson(json);
  Map<String, dynamic> toJson() => _$OrgBoldToJson(this);
}

/// Italic markup.
///
/// ```
/// /italic/
/// ```
@JsonSerializable()
class OrgItalic extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'italic';

  @override
  @NodeListConverter()
  final List children;

  OrgItalic({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgItalic.fromJson(Map<String, dynamic> json) =>
      _$OrgItalicFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgItalicToJson(this);
}

/// Code markup.
///
/// ```
/// ~code~
/// ```
@JsonSerializable()
class OrgCode extends OrgNodeTpl implements Node {
  @override
  final String type = 'code';

  final String value;

  OrgCode({required this.value});

  factory OrgCode.fromJson(Map<String, dynamic> json) =>
      _$OrgCodeFromJson(json);
  Map<String, dynamic> toJson() => _$OrgCodeToJson(this);
}

/// Verbatim markup
///
/// ```
/// =verbatim=
/// ```
@JsonSerializable()
class OrgVerbatim extends OrgNodeTpl implements Node {
  @override
  final String type = 'verbatim';

  final String value;

  OrgVerbatim({required this.value});

  factory OrgVerbatim.fromJson(Map<String, dynamic> json) =>
      _$OrgVerbatimFromJson(json);
  Map<String, dynamic> toJson() => _$OrgVerbatimToJson(this);
}

/// Strike through markup.
///
/// ```
/// +strike-through+
/// ```
@JsonSerializable()
class OrgStrikeThrough extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'strike-through';

  @override
  @NodeListConverter()
  final List children;

  OrgStrikeThrough(
      {int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgStrikeThrough.fromJson(Map<String, dynamic> json) =>
      _$OrgStrikeThroughFromJson(json);
  Map<String, dynamic> toJson() => _$OrgStrikeThroughToJson(this);
}

/// Underline markup.
///
/// ```
/// _underline_
/// ```
@JsonSerializable()
class OrgUnderline extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'underline';

  @override
  @NodeListConverter()
  final List children;

  OrgUnderline({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgUnderline.fromJson(Map<String, dynamic> json) =>
      _$OrgUnderlineFromJson(json);
  Map<String, dynamic> toJson() => _$OrgUnderlineToJson(this);
}

/// A character that is slightly above the normal line of type, and usually
/// smaller than the rest of the text.
///
/// pattern:
///
/// ```
/// CHAR_SCRIPT
/// ```
@JsonSerializable()
class OrgSuperscript extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'superscript';

  @override
  @NodeListConverter()
  final List children;

  OrgSuperscript({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgSuperscript.fromJson(Map<String, dynamic> json) =>
      _$OrgSuperscriptFromJson(json);
  Map<String, dynamic> toJson() => _$OrgSuperscriptToJson(this);
}

/// A character that is slightly below the normal line of type, and usually
/// smaller than the rest of the text.
///
/// ```
/// CHAR^SCRIPT
/// ```
@JsonSerializable()
class OrgSubscript extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'subscript';

  @override
  @NodeListConverter()
  final List children;

  OrgSubscript({int? contentsBegin, int? contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgSubscript.fromJson(Map<String, dynamic> json) =>
      _$OrgSubscriptFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgSubscriptToJson(this);
}

/// A hyperlink.
///
/// it has 4 patterns:
///
/// ```
/// PRE1 RADIO POST1          ("radio" link)
/// <PROTOCOL:PATH>           ("angle" link)
/// PRE2 PROTOCOL:PATH2 POST2 ("plain" link)
/// [[PATH3]DESCRIPTION]      ("regular" link)
/// ```
/// # Warning
/// radio target and plain are not supported.
@JsonSerializable()
class OrgLink extends OrgObjectTpl implements RecursiveObject {
  @override
  final type = 'link';

  @override
  @NodeListConverter()
  final List children;

  /// The format of this link.
  final OrgLinkFormat format;

  /// The PROTOCOL of this link.
  final String linkType;

  /// The raw string of this link.
  final String rawLink;

  /// The reset part of this link without protocol.
  final String path;

  OrgLink(
      {int? contentsBegin,
      int? contentsEnd,
      required this.children,
      required this.format,
      required this.linkType,
      required this.rawLink,
      required this.path})
      : super(contentsBegin, contentsEnd);

  factory OrgLink.fromJson(Map<String, dynamic> json) =>
      _$OrgLinkFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgLinkToJson(this);
}

@JsonEnum()
enum OrgLinkFormat { plain, bracket, angel }

@JsonSerializable()
class OrgText extends OrgNodeTpl implements Literal {
  @override
  final type = 'text';

  @override
  final dynamic value;

  OrgText({required this.value});

  factory OrgText.fromJson(Map<String, dynamic> json) =>
      _$OrgTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgTextToJson(this);
}

/// A timestamp object used in [OrgPlanning].
///
/// patterns:
///
/// ```
/// <%%(SEXP)>                                                     (diary)
/// <DATE TIME REPEATER-OR-DELAY>                                  (active)
/// [DATE TIME REPEATER-OR-DELAY]                                  (inactive)
/// <DATE TIME REPEATER-OR-DELAY>--<DATE TIME REPEATER-OR-DELAY>   (active range)
/// <DATE TIME-TIME REPEATER-OR-DELAY>                             (active range)
/// [DATE TIME REPEATER-OR-DELAY]--[DATE TIME REPEATER-OR-DELAY]   (inactive range)
/// [DATE TIME-TIME REPEATER-OR-DELAY]                             (inactive range)
/// ```
@JsonSerializable()
class OrgTimestamp extends OrgNodeTpl implements Node {
  @override
  final String type = 'timestamp';

  final OrgTimestampType timestampType;
  final String rawString;
  final OrgDuration? start;
  final OrgDuration? end;

  OrgTimestamp(
      {required this.timestampType,
      required this.rawString,
      this.start,
      this.end});

  factory OrgTimestamp.fromJson(Map<String, dynamic> json) =>
      _$OrgTimestampFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrgTimestampToJson(this);
}

/// ```
/// => HH:MM
/// ```
@JsonSerializable()
class OrgDuration {
  final int year;
  final int month;
  final int day;
  final int? hour;
  final int? minute;

  OrgDuration(
      {required this.year,
      required this.month,
      required this.day,
      this.hour,
      this.minute});

  factory OrgDuration.fromJson(Map<String, dynamic> json) =>
      _$OrgDurationFromJson(json);
  Map<String, dynamic> toJson() => _$OrgDurationToJson(this);
}

@JsonEnum(fieldRename: FieldRename.kebab)
enum OrgTimestampType { active, activeRange, diary, inactive, inactiveRange }

/// Footnote references has the following patterns:
///
/// ```
/// [fn:LABEL]
/// [fn:LABEL:DEFINITION]
/// [fn::DEFINITION]
/// ```
///
@JsonSerializable()
class OrgFootnoteReference extends OrgObjectTpl implements RecursiveObject {
  @override
  final String type = 'footnote-reference';

  @override
  @NodeListConverter()
  final List children;

  /// The label of a footnote reference.
  final String label;

  /// The type of a footnote reference.
  ///
  /// If the reference follows the second pattern, the value is
  /// [OrgFootnoteType.inline].
  ///
  /// If it follows the third one, i.e. if LABEL is omitted,
  /// the value is [OrgFootnoteType.anonymous].
  ///
  /// otherwise, the value is [OrgFootnoteType.standard].
  final OrgFootnoteType footnoteType;

  OrgFootnoteReference(
      {int? contentsBegin,
      int? contentsEnd,
      required this.children,
      required this.label,
      required this.footnoteType})
      : super(contentsBegin, contentsEnd);

  factory OrgFootnoteReference.fromJson(Map<String, dynamic> json) =>
      _$OrgFootnoteReferenceFromJson(json);
  Map<String, dynamic> toJson() => _$OrgFootnoteReferenceToJson(this);
}

@JsonEnum()
enum OrgFootnoteType { inline, standard, anonymous }

/// Latex Fragment has the following pattern:
///
/// ```
/// \NAME BRACKETS
/// \(CONTENTS\)
/// \[CONTENTS\]
/// $$CONTENTS$$
/// PRE$CHAR$POST
/// PRE$BORDER1 BODY BORDER2$POST
/// ```
@JsonSerializable()
class OrgLatexFragment extends OrgNodeTpl implements Node {
  @override
  final String type = 'latex-fragment';

  /// LaTeX code.
  final String value;

  //// LaTeX code without inline math delimiters.
  final String contents;

  OrgLatexFragment({required this.value, required this.contents});

  factory OrgLatexFragment.fromJson(Map<String, dynamic> json) =>
      _$OrgLatexFragmentFromJson(json);
  Map<String, dynamic> toJson() => _$OrgLatexFragmentToJson(this);
}

// @FIXME: figure out what this class for?
@JsonSerializable()
class OrgEntity extends OrgNodeTpl implements Node {
  @override
  final String type = 'entity';
  final String name;
  final bool useBrackets;
  final String latex;
  final bool requireLatexMath;
  final String html;
  final String ascii;
  final String latin1;
  final String utf8;

  OrgEntity(
      {required this.name,
      required this.useBrackets,
      required this.latex,
      required this.requireLatexMath,
      required this.html,
      required this.ascii,
      required this.latin1,
      required this.utf8});

  factory OrgEntity.fromJson(Map<String, dynamic> json) =>
      _$OrgEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrgEntityToJson(this);
}
