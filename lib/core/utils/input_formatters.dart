import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomInputFormatters {
  static MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static MaskTextInputFormatter cvvFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
