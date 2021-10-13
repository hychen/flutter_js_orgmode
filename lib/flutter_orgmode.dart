library flutter_orgmode;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_js/flutter_js.dart';

class Parser {
  late JavascriptRuntime jsEngine;

  Parser() {
    jsEngine = getJavascriptRuntime(xhr: false);
  }

  Future<Map> parse(String text) async {
    await tryLoadJsBundle();

    JsEvalResult result = jsEngine.evaluate("""
    const processor = vendor.unified.unified().use(vendor.parse)
    JSON.stringify(processor.parse('${json.encode(text)}'));
    """);
    // TODO: parse text.
    try {
      return json.decode(result.toString());
    } catch (e) {
      print(result.toString());
      return Map();
    }
  }

  Future<void> tryLoadJsBundle() async {
    String bundleLoaded = jsEngine.evaluate("""
    (typeof vendor === 'undefined') ? 0 : 1;
    """).stringResult;
    if(bundleLoaded == '0') {
      await loadJsBundle();
    }
  }

  Future<void> loadJsBundle() async {
      jsEngine.evaluate("""
    var window = global = globalThis;
    """);
      String jsBundle = await File('./assets/js/dist/bundle.js').readAsString();
      jsEngine.evaluate(jsBundle);
  }
}
