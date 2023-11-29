import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final bool readonly;
  final TextEditingController controller;
  final String label;
  final maxLines;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;

  const CustomInputField({
    required this.label,
    required this.controller,
    this.readonly = false,
    this.maxLines = 1,
    this.onTap,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
      controller: controller,
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
    );
  }
}
