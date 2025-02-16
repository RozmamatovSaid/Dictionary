import 'package:flutter/material.dart';

class input_text extends StatelessWidget {
  const input_text({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextFormField(
          maxLines: 1,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black.withValues(alpha: 0.3),
            ),
            fillColor: Colors.purple,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 20,
              borderSide: BorderSide(width: 3, color: Colors.greenAccent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 3, color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
