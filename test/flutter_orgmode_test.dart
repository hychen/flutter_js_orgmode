import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_orgmode/flutter_orgmode.dart';

void main() {
  test('it works', () async {
    final parser = Parser();
    var orgdata = await parser.parse(""""
    * example
    - 測試 1234
    - 2
    """);
    expect(orgdata['children'][1]['type'], 'plain-list');
  });
}
