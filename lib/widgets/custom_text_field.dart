import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.labelText,
      this.onchange,
      this.obsecure = false,
      this.inputType});

  Function(String)? onchange;
  final String? labelText;
  final bool? obsecure;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure!,
      keyboardType: inputType,
      onChanged: onchange,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 214, 169, 169)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
