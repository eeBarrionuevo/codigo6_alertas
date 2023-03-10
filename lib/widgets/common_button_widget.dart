import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff605AF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: Text(
          "Iniciar Sesión",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
