import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';

class RegisterIncidentModal extends StatefulWidget {
  const RegisterIncidentModal({super.key});

  @override
  State<RegisterIncidentModal> createState() => _RegisterIncidentModalState();
}

class _RegisterIncidentModalState extends State<RegisterIncidentModal> {
  int indexIncidentType = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enviar Alerta",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(0.07),
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: indexIncidentType,
                isExpanded: true,
                // icon: Icon(Icons.chevron_right),
                // underline: SizedBox(),
                borderRadius: BorderRadius.circular(14.0),
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("Robo"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("Secuestro"),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text("Mordedura"),
                  ),
                ],
                onChanged: (int? value) {
                  indexIncidentType = value!;
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          CommonButtonWidget(
            text: "Enviar",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
