import 'package:flutter/material.dart';

class TextFieldIdentifier extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  const TextFieldIdentifier({Key? key, this.controller, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 290,
      child: TextFormField(
        textCapitalization: TextCapitalization.characters,
        controller: controller,
        decoration: InputDecoration(
          labelText: label!.toUpperCase(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 1, 11, 58)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 1, 11, 58)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
