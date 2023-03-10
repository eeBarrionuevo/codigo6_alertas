import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/utils/types.dart';
import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:codigo6_alertas/widgets/common_texfield_widget.dart';
import 'package:codigo6_alertas/widgets/common_textfield_password_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Image.network(
                  "https://www.municayma.gob.pe/wp-content/uploads/2021/07/escudo-solo.png",
                  height: 90.0,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Municipalidad Distrital de Cayma",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff212121),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Alerta Cayma",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff212121),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                CommonTextFieldWidget(
                  label: "DNI",
                  hintText: "Tu DNI",
                  type: InputType.dni,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CommonTextFieldPasswordWidget(),
                const SizedBox(
                  height: 30.0,
                ),
                CommonButtonWidget(
                  text: "Iniciar Sesión",
                  onPressed: () {
                    ApiService apiService = ApiService();
                    apiService.login();
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aún no estás registrado? ",
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Regístrate",
                        style: TextStyle(
                          color: Color(0xff605AF8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
