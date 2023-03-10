import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> login() async {
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
    if (response.statusCode == 200) {}
  }

  register() {}

  //
}
