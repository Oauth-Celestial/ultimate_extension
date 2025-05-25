import 'package:flutter_test/flutter_test.dart';
import 'package:ultimate_extension/ultimate_extension.dart';

void main() {
  group("Extension Date test", () {
    test("Format Ui", () {
      String date = "01/01/001";

      expect(date, date.formatAsUiDate(uiFormat: "dd/MM/yyyy"));
    });
  });
}
