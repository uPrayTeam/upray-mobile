import 'package:upray_mobile/core/utils/constants.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class Validators {
  static String? emptyValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    if (!RegExp(r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value!)) {
      return t.validators.emailInvalid;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }

    if (value!.length < Constants.minPassLength) {
      return t.validators.passTooShort;
    }

    if (!value.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      return t.validators.passMustContainChar;
    }

    return null;
  }

  static String? repeatPasswordValidator(String? value1, String? value2) {
    if (value1?.trim().isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    if (value2?.trim().isEmpty ?? true) {
      return t.validators.passwordCannotBeEmpty;
    }
    if (value1 != value2) {
      return t.validators.passwordsAreNotTheSame;
    }

    return null;
  }
}
