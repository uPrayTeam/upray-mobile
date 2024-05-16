import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter_recruitment_task/gen/strings.g.dart';

class Validators {
  static String? emptyValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    return null;
  }

  static String? cardValidator(String? value) {
    CreditCardValidator cardValidator = CreditCardValidator();
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }

    if (value!.length < 16) {
      return t.validators.ccNumberTooShort;
    }

    final result = cardValidator.validateCCNum(value);
    if (!result.isValid) {
      return t.validators.invalidCC;
    }

    return null;
  }

  static String? cvvValidator(String? value) {
    CreditCardValidator cardValidator = CreditCardValidator();
    if (value?.isEmpty ?? true) {
      return t.validators.fieldCannotBeEmpty;
    }
    if (value!.length < 3) {
      return t.validators.cvvTooShort;
    }

    final result = cardValidator.validateCVV(value, CreditCardValidator.unknownCardType);
    if (!result.isValid) {
      return t.validators.cvvInvalid;
    }

    return null;
  }
}
