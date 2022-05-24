import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_js_context/flutter_js_context.dart';

import 'assets.dart';
import 'greater_elements.dart' show OrgData;

/// The OrgMode parser.
///
/// ```
/// final text = """
/// #+TITLE: document title
/// * TODO Headline
/// this is a sentence.
/// - unordered list item 1.
/// - unordered list item 2.
/// """
/// Parser.parse(text).children[0].todoKeyword == 'TODO';
/// ```
class OrgParser {
  JsContext context;

  OrgParser() : context = JsContext() {
    context.evaluate(jsBundle);
  }

  /// Parses [text] and returns [OrgData].
  ///
  /// Returns null if the processing is failed.
  Future<OrgData?> parse(String text) async {
    final encodedText = json.encode(text);
    // remove " append in the start and end position which make parsing incorrect.
    final strippedText = encodedText.substring(1, encodedText.length - 1);
    try {
      var result = await context.evaluateAsync("""
      var processor = vendor.unified().use(vendor.parse);
      JSON.stringify(processor.parse('$strippedText'));
     """);
      return OrgData.fromJson(jsonDecode(result));
    } catch (e) {
      debugPrint(
          "The following text can not be parsed:\n $text \n failure:\n $e");
      return null;
    }
  }

  /// Parses [text] and returns [OrgData].
  ///
  /// Returns null if the processing is failed.
  OrgData? parseSync(String text) {
    final encodedText = json.encode(text);
    // remove " append in the start and end position which make parsing incorrect.
    final strippedText = encodedText.substring(1, encodedText.length - 1);
    try {
      var result = context.evaluate("""
      var processor = vendor.unified().use(vendor.parse);
      JSON.stringify(processor.parse('$strippedText'));
     """);
      return OrgData.fromJson(jsonDecode(result));
    } catch (e) {
      debugPrint(
          "The following text can not be parsed:\n $text \n failure:\n $e");
      return null;
    }
  }

  Future<T> parseType<T>(String text) async {
    final OrgData? orgdata = await parse(text);
    return orgdata?.children.whereType<T>().toList()[0] as T;
  }
}
