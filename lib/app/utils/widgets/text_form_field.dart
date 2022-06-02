import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isObscureText;
  final bool? isEnableSugestions;
  final bool? isEnableAutoCorrect;
  final void Function(String?)? onSaved;
  final String Function(String?)? validator;
  final void Function(String)? onChanged;

  const TextFormFieldWidget(
      {Key? key,
      required this.labelText,
      this.keyboardType,
      this.onSaved,
      this.validator,
      this.inputFormatter,
      this.isObscureText,
      this.isEnableSugestions,
      this.isEnableAutoCorrect,
      required this.controller, this.onChanged,this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: TextFormField(
        validator: validator,
        initialValue: initialValue,
        inputFormatters: inputFormatter,
        keyboardType: keyboardType,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          labelText: labelText,
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}
