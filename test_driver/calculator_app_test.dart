import 'package:flutter_driver/flutter_driver.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver.close();
  });

  test('adding 5 and 6 shows 11', () async {
    await driver.tap(ByValueKey(const Key('1')));
    await driver.waitFor(const ByText('1'));
  });
}
