import 'package:flutter/material.dart';

class DynamicTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final BuildContext? actual_context;
  final String? label;
  final Icon? icon;
  final TextEditingController? controller;

  const DynamicTextField({
    super.key,
    this.onChanged,
    this.actual_context,
    this.controller,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
        contentPadding: EdgeInsets.all(16),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            controller!.clear();
          },
        ),
      ),
    );
  }
}