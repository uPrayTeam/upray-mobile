import 'package:upray_mobile/gen/strings.g.dart';

class Validators {
  static String? emptyValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    return null;
  }
}
