class IncidentModel {
  IncidentModel({
    required this.id,
    required this.tipoIncidente,
    required this.longitud,
    required this.latitud,
    required this.fecha,
    required this.hora,
    required this.fechaCreacion,
    required this.datosCiudadano,
    required this.estadoDisplay,
    required this.tipoOrigenDisplay,
  });

  int id;
  TipoIncidente tipoIncidente;
  double longitud;
  double latitud;
  String fecha;
  String hora;

  String fechaCreacion;
  DatosCiudadano datosCiudadano;
  String estadoDisplay;
  String tipoOrigenDisplay;

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        id: json["id"],
        tipoIncidente: TipoIncidente.fromJson(json["tipoIncidente"]),
        longitud: json["longitud"]?.toDouble(),
        latitud: json["latitud"]?.toDouble(),
        fecha: json["fecha"],
        hora: json["hora"],
        fechaCreacion: json["fechaCreacion"],
        datosCiudadano: DatosCiudadano.fromJson(json["datosCiudadano"]),
        estadoDisplay: json["estado_display"],
        tipoOrigenDisplay: json["tipoOrigen_display"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipoIncidente": tipoIncidente.toJson(),
        "longitud": longitud,
        "latitud": latitud,
        "fecha": fecha,
        "hora": hora,
        "fechaCreacion": fechaCreacion,
        "datosCiudadano": datosCiudadano.toJson(),
        "estado_display": estadoDisplay,
        "tipoOrigen_display": tipoOrigenDisplay,
      };
}

class DatosCiudadano {
  DatosCiudadano({
    required this.nombres,
    required this.dni,
    required this.telefono,
  });

  String nombres;
  String dni;
  String telefono;

  factory DatosCiudadano.fromJson(Map<String, dynamic> json) => DatosCiudadano(
        nombres: json["nombres"],
        dni: json["dni"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "dni": dni,
        "telefono": telefono,
      };
}

class TipoIncidente {
  TipoIncidente({
    required this.id,
    required this.value,
    required this.text,
    required this.titulo,
    required this.area,
    required this.nivel,
  });

  int id;
  int value;
  String text;
  String titulo;
  String area;
  String nivel;

  factory TipoIncidente.fromJson(Map<String, dynamic> json) => TipoIncidente(
        id: json["id"],
        value: json["value"],
        text: json["text"],
        titulo: json["titulo"],
        area: json["area"],
        nivel: json["nivel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "text": text,
        "titulo": titulo,
        "area": area,
        "nivel": nivel,
      };
}
