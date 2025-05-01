import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_extension/ultimate_extension.dart';

void main() {
  group("Given a Extension of object ", () {
    test("Object is Null", () {
      String? nullCheck = null;
      expect(nullCheck.isNull, true);
    });

    test("Object is not null", () {
      String? notNull = null;
      expect(notNull.isNotNull, false);
    });

    test("Integer Object", () {
      int intergerType = 2;
      expect(intergerType.whatsMydataType, int);
    });
  });
}
