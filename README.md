<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

An Org Mode parser in Flutter apps.

This package supports most of org-mode syntax and aim to parse accuracy
through [uniorg](https://github.com/rasendubi/uniorg/) library from JavaScript ecosystem.

> This package is in very early stage and only be tested on MacOS. Use it with caution and file
any potential issues you see.

## Features

Use this package to
- Parse raw Org Mode documents as native Dart models.
- Serialize to json, or deserialize from json.

## Usage

```dart
import 'package:flutter_orgmode/flutter_orgmode.dart';

final orgdata = OrgParser().parse(
"""
#+title: Dart
* TODO [#A] Headline mei
- 測試 1234
- 2
* Just
""").then((orgdata) {
  print(orgdata.children[1].children[0].todoKeyword); // TODO.
});
```

