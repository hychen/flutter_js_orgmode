import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_js_orgmode/flutter_js_orgmode.dart';

void main() {
  group('OrgSection', () {
    test('getSubSections()', () async {
      const text = """
* Headline 1
** [[https://example.com][link]] Headline 2
** [[https://example.com][link]] Headline 3
*** [[https://example.com][link]] Headline 4
**** [[https://example.com][link]] Headline 5
""";
      final OrgSection section = await OrgParser().parseType(text);
      var subsections = section.getSubSections().toList();
      expect(subsections.length, 2);
      subsections = section.getSubSections(recursive: true).toList();
      expect(subsections.length, 4);
      expect(section.allSubSections.length, 4);
    });

    test("headline", () async {
      const text = "* Headline";
      final OrgSection section = await OrgParser().parseType(text);
      expect(section.headline.rawValue, "Headline");
    });

    test("getHeadlines()", () async {
      const text = """
* Headline 1
** [[https://example.com][link]] Headline 2
** [[https://example.com][link]] Headline 3
*** [[https://example.com][link]] Headline 4
**** [[https://example.com][link]] Headline 5
""";
      final OrgSection section = await OrgParser().parseType(text);
      var headlines = section.getHeadlines().toList();
      expect(headlines.length, 1);

      headlines = section.getHeadlines(recursive: true).toList();
      expect(headlines.length, 5);
      expect(headlines[0].level, 1);
      expect(headlines[1].level, 2);
      expect(headlines[2].level, 2);
      expect(headlines[3].level, 3);
      expect(headlines[4].level, 4);
    });
  });
}
