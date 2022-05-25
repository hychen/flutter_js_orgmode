import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:flutter_js_orgmode/flutter_js_orgmode.dart';

void main() {
  final parser = OrgParser();

  test('parse from string', () async {
    var orgdata = await parser.parse(
        ':PROPERTIES:\n:ID:       2854ecc3-920a-4604-bc14-24b47971707a\n:END:\n#+title: LAO\n');
    expect(orgdata?.children[0].type, 'property-drawer');
    expect(orgdata?.children[1].type, 'keyword');
  });

  test('parse from file', () async {
    var text =
        File(Directory.current.path + '/test/test.org').readAsStringSync();
    var orgdata = await parser.parse(text);
    expect(orgdata?.children[0].type, 'property-drawer');
    expect(orgdata?.children[1].type, 'keyword');
  });

  test('parse sync', () {
    var orgdata = parser.parseSync(
        ':PROPERTIES:\n:ID:       2854ecc3-920a-4604-bc14-24b47971707a\n:END:\n#+title: LAO\n');
    expect(orgdata?.children[0].type, 'property-drawer');
    expect(orgdata?.children[1].type, 'keyword');
  });

  test('getAllLinks', () {
    final orgdata = parser.parseSync(
"""
#+title: title

this is a [[https://a.com][link0]]

* [[https://example.com][Headline Link 1]]
- [[https://example.com][List-item Link 2]]

...
[fn:1] The link is: https://orgmode.org
""");
    final links = orgdata!.getAllLinks();
    expect(links.length, 4);
    expect(links[0].name, 'link0');
  });
}
