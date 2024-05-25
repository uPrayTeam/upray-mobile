import 'package:flutter/material.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? autocorrect;
  final List<String>? autofillHints;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final String? textLabel;
  final TextInputType? keyboardType;
  final bool? enabled;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final bool? showCursor;
  final String? obscuringCharacter;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onEditingComplete;
  final bool? enableSuggestions;
  final Brightness? keyboardAppearance;
  final EdgeInsetsGeometry? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextCapitalization? textCapitalization;
  final ScrollPhysics? scrollPhysics;
  final InputCounterWidgetBuilder? buildCounter;
  final bool? enableIMEPersonalizedLearning;
  final bool isRequired;

  CustomTextFormField({
    this.controller,
    this.autocorrect,
    this.autofillHints,
    this.validator,
    this.obscureText,
    this.autovalidateMode,
    this.decoration,
    this.textLabel,
    this.keyboardType,
    this.enabled,
    this.onChanged,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.showCursor,
    this.obscuringCharacter,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.enableSuggestions,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.textCapitalization,
    this.scrollPhysics,
    this.buildCounter,
    this.enableIMEPersonalizedLearning,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textLabel != null) ...[
          Row(
            children: [
              Text(
                textLabel!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if (isRequired)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ],
        TextFormField(
          controller: controller,
          autocorrect: autocorrect ?? true,
          autofillHints: autofillHints,
          validator: validator,
          obscureText: obscureText ?? false,
          autovalidateMode: autovalidateMode,
          decoration: decoration,
          keyboardType: keyboardType,
          enabled: enabled,
          onChanged: onChanged,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus ?? false,
          readOnly: readOnly ?? false,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter ?? '•',
          maxLines: maxLines ?? 1,
          minLines: minLines,
          expands: expands ?? false,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onEditingComplete: onEditingComplete,
          enableSuggestions: enableSuggestions ?? true,
          keyboardAppearance: keyboardAppearance,
          enableInteractiveSelection: enableInteractiveSelection ?? true,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          scrollPhysics: scrollPhysics,
          buildCounter: buildCounter,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        ),
      ],
    );
  }
}
