/// This library implements models used in "Greater Element" environments
/// described in org-mode syntax spec.
library greater_element;

import 'package:flutter/widgets.dart';
import 'package:flutter_js_orgmode/flutter_js_orgmode.dart';
import 'package:json_annotation/json_annotation.dart';

import 'elements.dart';
import 'unist.dart';
import 'base.dart';
import 'converter.dart';

part 'greater_elements.g.dart';

const greaterElementType = [
  'org-data',
  'section',
  'property-drawer',
  'drawer',
  'plain-list',
  'list-item',
  'quote-block',
  'verse-block',
  'center-block',
  'special-block',
  'footnote-definition',
  'table'
];

greaterElementTypeFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'org-data':
      return OrgData.fromJson(json);
    case 'section':
      return OrgSection.fromJson(json);
    case 'property-drawer':
      return OrgPropertyDrawer.fromJson(json);
    case 'drawer':
      return OrgDrawer.fromJson(json);
    case 'plain-list':
      return OrgList.fromJson(json);
    case 'list-item':
      return OrgListItem.fromJson(json);
    case 'quote-block':
      return OrgQuoteBlock.fromJson(json);
    case 'verse-block':
      return OrgVerseBlock.fromJson(json);
    case 'center-block':
      return OrgCenterBlock.fromJson(json);
    case 'special-block':
      return OrgSpecialBlock.fromJson(json);
    case 'footnote-definition':
      return OrgFootnoteDefinition.fromJson(json);
    case 'table':
      return OrgTableEl.fromJson(json);
    default:
      throw ArgumentError('is not a valid GreaterElementType.', 'json');
  }
}

@JsonSerializable()
class OrgData extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'org-data';

  @override
  @NodeListConverter()
  final List children;

  OrgData(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgData.fromJson(Map<String, dynamic> json) =>
      _$OrgDataFromJson(json);
  Map<String, dynamic> toJson() => _$OrgDataToJson(this);

  List<OrgLink> getAllLinks() {
    List<OrgLink> loop(lst){
      List<OrgLink> result = [];
      for(var element in lst) {
        if(element is OrgLink) {
          result.add(element);
        }
        else if(element is Parent && element.children.isNotEmpty ) {
          result += loop(element.children);
        }
      }
      return result;
    }
    return loop(children);
  }
}

/// A [OrgSection] contains directly any [GreaterElement] or [OrgElement].
/// Only a [OrgHeadline] can contain a [OrgSection].
///
/// As an exception, text before the first headline in the document also
/// belongs to a section.
///
/// ```
/// An introduction.
/// * A Headline
///   Some text.
/// ** Sub-Topic 1
/// ```
///
/// has the following structure.
///
/// ```
/// - doc:
///   - section:
///     - headline:
///       - section:
///         - headline
/// ```
@JsonSerializable()
class OrgSection extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'org-section';

  @override
  @NodeListConverter()
  final List children;

  OrgSection(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgSection.fromJson(Map<String, dynamic> json) =>
      _$OrgSectionFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgSectionToJson(this);

  List<OrgSection> get allSubSections =>
      getSubSections(recursive: true).toList();

  Iterable<OrgSection> getSubSections({recursive = false}) {
    Iterable<OrgSection> aux(OrgSection section) {
      final result = section.children.whereType<OrgSection>();
      return recursive
          ? result.followedBy(
              result.map((e) => aux(e)).expand((element) => element))
          : result;
    }

    return aux(this);
  }

  /// Returns the headline.
  OrgHeadline get headline =>
      children.firstWhere((element) => element is OrgHeadline);

  /// Returns all headlines, includes the headlines in sub sections.
  List<OrgHeadline> get allHeadlines => getHeadlines(recursive: true).toList();

  Iterable<OrgHeadline> getHeadlines({bool recursive: false}) {
    Iterable<OrgHeadline> getHeadlines(OrgSection section) {
      Iterable<OrgHeadline> result = section.children.whereType<OrgHeadline>();
      return (recursive & section.getSubSections().isNotEmpty)
          ? result
              .followedBy(section.getSubSections().map(getHeadlines).expand((e) => e))
          : result;
    }

    return getHeadlines(this);
  }
}

/// Drawer has the following pattern:
///
/// ```
/// :NAME:
/// CONTENTS
/// :END:
/// ```
@JsonSerializable()
class OrgDrawer extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  final String type = 'drawer';

  /// The contents of the drawer. It can contain any element but another
  /// drawer.
  @override
  final List children;

  /// The name of the drawer. It can contain word-constituent characters,
  /// hyphens and underscores.
  final String name;

  OrgDrawer(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children,
      required this.name})
      : super(contentsBegin, contentsEnd);

  factory OrgDrawer.fromJson(Map<String, dynamic> json) =>
      _$OrgDrawerFromJson(json);
  Map<String, dynamic> toJson() => _$OrgDrawerToJson(this);
}

/// Property drawers are a special type of drawer containing [OrgNodeProperty]
/// attached to a [OrgHeadline].
///
/// It has the following pattern.
///
/// ```
/// :PROPERTIES:
/// CONTENTS
/// :END:
/// ```
@JsonSerializable()
class OrgPropertyDrawer extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'property-drawer';

  /// the contents of this drawer.
  @override
  final List<OrgNodeProperty> children;

  OrgPropertyDrawer(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgPropertyDrawer.fromJson(Map<String, dynamic> json) =>
      _$OrgPropertyDrawerFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgPropertyDrawerToJson(this);
}

/// A set of consecutive items of the same indentation.
/// It can only directly contain some [OrgListItem].
@JsonSerializable()
class OrgList extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'plain-list';

  @override
  final List<OrgListItem> children;

  /// The indent level of the list.
  final int indent;

  /// The type of the list.
  ///
  /// the value is [OrgListType.ordered].
  /// if the list has a counter in its bullet,
  ///
  /// if the list has a tag in its bullet,
  /// the value is [OrgListType.descriptive].
  ///
  /// otherwise, it is [OrgListType.unordered].
  final OrgListType listType;

  OrgList(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children,
      required this.indent,
      required this.listType})
      : super(contentsBegin, contentsEnd);

  factory OrgList.fromJson(Map<String, dynamic> json) =>
      _$OrgListFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgListToJson(this);
}

@JsonEnum(fieldRename: FieldRename.kebab)
enum OrgListType { ordered, unordered, descriptive }

/// A line starting with the following pattern: “BULLET COUNTER-SET CHECK-BOX TAG”,
/// in which only BULLET is mandatory.
@JsonSerializable()
class OrgListItem extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'list-item';

  @override
  @NodeListConverter()
  final List children;

  /// The indent level
  final int indent;

  /// The bullet tag.
  final String bullet;

  /// The counter of this item if this item is in a ordered-list.
  final String? counter;

  /// The checkbox status.
  final OrgCheckboxType? checkbox;

  OrgListItem({
    required int contentsBegin,
    required int contentsEnd,
    required this.children,
    required this.indent,
    required this.bullet,
    this.counter,
    this.checkbox,
  }) : super(contentsBegin, contentsEnd);

  factory OrgListItem.fromJson(Map<String, dynamic> json) =>
      _$OrgListItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrgListItemToJson(this);
}

/// CHECK-BOX is either a single whitespace character, a “X” character
/// or a hyphen, enclosed within square brackets.
///
/// it has three status:
/// - [ ] <- off
/// - [X] <- on
/// - [-] <- trans
@JsonEnum(fieldRename: FieldRename.kebab)
enum OrgCheckboxType { on, off, trans }

/// Quote Block.
///
/// ```
/// #+BEGIN_QUOTE
/// CONTENTS
/// #+END_QUOTE
/// ```
@JsonSerializable()
class OrgQuoteBlock extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  String type = 'quote-block';

  @override
  @NodeListConverter()
  final List children;

  OrgQuoteBlock(
      {required contentsBegin, required contentsEnd, required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgQuoteBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgQuoteBlockFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgQuoteBlockToJson(this);
}

/// Verse Block
///
/// ```
/// #+BEGIN_VERSE
/// CONTENTS
/// #+END_VERSE
/// ```
@JsonSerializable()
class OrgVerseBlock extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  final String type = 'verse-block';
  @override
  @NodeListConverter()
  List children;

  OrgVerseBlock(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children})
      : super(contentsBegin, contentsEnd);

  factory OrgVerseBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgVerseBlockFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgVerseBlockToJson(this);
}

/// Center Block
///
/// ```
/// #+BEGIN_CENTER
/// CONTENTS
/// #+END_CENTER
/// ```
@JsonSerializable()
class OrgCenterBlock extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  final String type = 'center-block';

  @override
  @NodeListConverter()
  final List children;

  OrgCenterBlock(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children})
      : super(contentsBegin, contentsEnd);
  factory OrgCenterBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgCenterBlockFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgCenterBlockToJson(this);
}

@JsonSerializable()
class OrgSpecialBlock extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  final String type = 'special-block';

  @override
  @NodeListConverter()
  final List children;

  final String blockType;

  OrgSpecialBlock(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children,
      required this.blockType})
      : super(contentsBegin, contentsEnd);

  factory OrgSpecialBlock.fromJson(Map<String, dynamic> json) =>
      _$OrgSpecialBlockFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgSpecialBlockToJson(this);
}

/// Pattern for footnote definition is
///
/// ```
/// [fn:LABEL] CONTENTS
/// ````
@JsonSerializable()
class OrgFootnoteDefinition extends GreaterElementMeta
    with WithAffiliatedKeywords
    implements GreaterElement {
  @override
  final String type = 'footnote-definition';

  @override
  @NodeListConverter()
  final List children;

  final String label;

  OrgFootnoteDefinition(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children,
      required this.label})
      : super(contentsBegin, contentsEnd);

  factory OrgFootnoteDefinition.fromJson(Map<String, dynamic> json) =>
      _$OrgFootnoteDefinitionFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgFootnoteDefinitionToJson(this);
}

/// A table starting with a vertical bar that has the following patter:
///
/// ```
/// | col1 | col2 |
//  |------+------|
//  | val1 | val2 |
/// ```
@JsonSerializable()
class OrgTableOrg extends GreaterElementMeta implements GreaterElement {
  @override
  final String type = 'table';

  @override
  final List<OrgTableRow> children;

  /// Formulas associated to the table, if any.
  final String? tblfm;

  final String tableType = 'org';

  OrgTableOrg(
      {required int contentsBegin,
      required int contentsEnd,
      required this.children,
      this.tblfm})
      : super(contentsBegin, contentsEnd);

  factory OrgTableOrg.fromJson(Map<String, dynamic> json) =>
      _$OrgTableOrgFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgTableOrgToJson(this);
}

/// A table without a vertical bar that has the following pattern:
///
/// ```
/// | col1 | col2 |
//  | val1 | val2 |
/// ```
@JsonSerializable()
class OrgTableEl extends OrgNodeTpl implements Node {
  @override
  final String type = 'table';

  /// Formulas associated to the table, if any.
  final String? tblfm;

  final String tableType = 'table.el';

  /// Raw `table.el` table.
  final String value;

  OrgTableEl({this.tblfm, required this.value});

  factory OrgTableEl.fromJson(Map<String, dynamic> json) =>
      _$OrgTableElFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OrgTableElToJson(this);
}
