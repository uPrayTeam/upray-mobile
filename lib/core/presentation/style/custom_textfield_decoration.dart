import 'package:flutter/material.dart';

class CustomTextfieldDecoration extends InputDecoration {
  const CustomTextfieldDecoration({super.labelText, super.hintText});

  @override
  InputBorder? get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      );

  @override
  int? get errorMaxLines => 2;
}
