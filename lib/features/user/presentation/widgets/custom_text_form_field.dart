import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? label;

  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
      ),
    );
  }
}
