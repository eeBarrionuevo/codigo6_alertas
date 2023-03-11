import 'package:codigo6_alertas/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String label;
  String hintText;
  InputType type;
  TextEditingController controller;

  CommonTextFieldWidget({
    required this.label,
    required this.hintText,
    required this.type,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label:",
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: type == InputType.dni || type == InputType.phone
                ? TextInputType.number
                : TextInputType.text,
            maxLength: type == InputType.dni
                ? 8
                : type == InputType.phone
                    ? 9
                    : null,
            inputFormatters: type == InputType.dni || type == InputType.phone
                ? [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))]
                : [],
            decoration: InputDecoration(
              counterText: "",
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14.0,
              ),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
