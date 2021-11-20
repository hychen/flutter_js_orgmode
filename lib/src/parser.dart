import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_js/flutter_js.dart';

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
  /// The JavaScript runtime. It is JavaScriptCore on MacOS or iOS.
  late JavascriptRuntime jsEngine;

  OrgParser() {
    jsEngine = getJavascriptRuntime(xhr: false);
  }

  /// Parses [text] and returns [OrgData].
  ///
  /// Returns null if the processing is failed.
  Future<OrgData?> parse(String text) async {
    final encodedText = json.encode(text);
    // remove " append in the start and end position which make parsing incorrect.
    final strippedText = encodedText.substring(1, encodedText.length - 1);
    try {
      await _tryLoadJsBundle();
      var result = await jsEngine.evaluateAsync("""
      var processor = vendor.unified().use(vendor.parse);
      JSON.stringify(processor.parse('$strippedText'));
     """);
      return OrgData.fromJson(json.decode(result.toString()));
    } catch (e) {
      debugPrint(
          "The following text can not be parsed:\n $text \n failure:\n $e");
      return null;
    }
  }

  Future<void> _tryLoadJsBundle() async {
    String bundleLoaded = jsEngine.evaluate("""
    (typeof vendor === 'undefined') ? 0 : 1;
    """).stringResult;
    if (bundleLoaded == '0') {
      await _loadJsBundle();
    }
  }

  Future<void> _loadJsBundle() async {
    jsEngine.evaluate("""
    var window = global = globalThis;
    """);
    jsEngine.evaluate(jsBundle);
  }
}
