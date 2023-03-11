import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel?> login() async {
    try {
      Uri url = Uri.parse("http://167.99.240.65/API/login/");
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {"username": "45231212", "password": "mantequilla"},
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data["user"]);
        return userModel;
      }
      return null;
    } on TimeoutException catch (e) {
      return Future.error({
        "message":
            "Hubo un inconveniente con el servidor, por favor inténtalo luego."
      });
    } on SocketException catch (e) {
      return Future.error({
        "message":
            "Hubo un inconveniente con el internet, por favor inténtalo luego."
      });
    } on Error catch (e) {
      return Future.error(
          {"message": "Hubo un inconveniente por favor inténtalo luego."});
    }
  }

  register() {}

  //
}
