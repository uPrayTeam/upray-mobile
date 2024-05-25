import 'package:upray_mobile/core/utils/constants.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class Validators {
  static String? emptyValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    return emptyValidator(value);
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }

    if (value!.length < Constants.minPassLength) {
      return t.validators.passTooShort;
    }

    if (!value.contains(RegExp('[0-9]'))) {
      return t.validators.passMustContainChar;
    }

    return null;
  }

  static String? repeatPasswordValidator(String? value1, String? value2) {
    if (value1?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    if (value2?.isEmpty ?? true) {
      return t.validators.passwordCannotBeEmpty;
    }
    if (value1 != value2) {
      return t.validators.passwordsAreNotTheSame;
    }

    return null;
  }
}
