import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/models/incident_type_model.dart';
import 'package:codigo6_alertas/models/news_model.dart';
import 'package:codigo6_alertas/models/user_model.dart';
import 'package:codigo6_alertas/utils/sp_global.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  Future<UserModel> login(String dni, String password) async {
    try {
      Uri url = Uri.parse("http://167.99.240.65/API/login/");
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {"username": dni, "password": password},
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data["user"]);
        SPGlobal().isLogin = true;
        SPGlobal().token = data["access"];
        return userModel;
      } else if (response.statusCode == 400) {
        throw {"message": "Tus credenciales fueron incorrectas."};
      } else {
        throw {"message": "Hubo un error."};
      }
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

  Future<List<IncidentModel>> getIncidents() async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //UTF 8
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<IncidentModel> incidents = [];
      incidents = data.map((e) => IncidentModel.fromJson(e)).toList();
      return incidents;
    }
    return [];
  }

  Future<List<IncidentTypeModel>> getIncidentsType() async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/tipos/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<IncidentTypeModel> incidentsType = [];
      incidentsType = data.map((e) => IncidentTypeModel.fromJson(e)).toList();
      return incidentsType;
    }
    return [];
  }

  Future<IncidentModel> registerIncident(int type, Position position) async {
    Uri url = Uri.parse("http://167.99.240.65/API/incidentes/crear/");
    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${SPGlobal().token}",
      },
      body: json.encode(
        {
          "latitud": position.latitude,
          "longitud": position.longitude,
          "tipoIncidente": type,
          "estado": "Abierto"
        },
      ),
    );
    if (response.statusCode == 201) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      IncidentModel incidentModel = IncidentModel.fromJson(data);
      return incidentModel;
    } else {
      throw {"message": "Hubo un incoveniente, inténtalo nuevamente."};
    }
  }

  Future<List<NewsModel>> getNews() async {
    Uri url = Uri.parse("http://167.99.240.65/API/noticias/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String dataConvert = Utf8Decoder().convert(response.bodyBytes);
      List data = json.decode(dataConvert);
      List<NewsModel> news = [];
      news = data.map((e) => NewsModel.fromJson(e)).toList();
      return news;
    }
    return [];
  }

  Future<NewsModel> registerNews(NewsModel model) async {
    Uri url = Uri.parse("http://167.99.240.65/API/noticias/");
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      url,
    );
    //set headers
    //request.headers.addAll({});
    request.fields["titulo"] = model.titulo;
    request.fields["link"] = model.link;
    request.fields["fecha"] = model.fecha.toString().substring(0, 10);

    List<String> dataMime = mime(model.imagen)!.split("/");

    http.MultipartFile file = await http.MultipartFile.fromPath(
      "imagen",
      model.imagen,
      contentType: MediaType(dataMime[0], dataMime[1]),
    );
    request.files.add(file);

    http.StreamedResponse streamedResponse = await request.send();

    http.Response response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
      Map<String, dynamic> data = json.decode(dataConvert);
      NewsModel news = NewsModel.fromJson(data);
      return news;
    } else {
      throw {"message": "Hubo un incoveniente, inténtalo nuevamente."};
    }
  }
}
