import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  const InputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller);
  }
}
