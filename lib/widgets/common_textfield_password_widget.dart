import 'package:flutter/material.dart';

class CommonTextFieldPasswordWidget extends StatefulWidget {
  const CommonTextFieldPasswordWidget({super.key});
  @override
  State<CommonTextFieldPasswordWidget> createState() =>
      _CommonTextFielPasswordWidgetState();
}

class _CommonTextFielPasswordWidgetState
    extends State<CommonTextFieldPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Contraseña:",
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
            decoration: InputDecoration(
              hintText: "Tu contraseña",
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
