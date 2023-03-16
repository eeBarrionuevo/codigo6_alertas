import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/widgets/general_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkers = {};
  ApiService apiService = ApiService();

  void showIncidentDetail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Detalle de la alerta",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                "Tipo: Secuestro",
              ),
              Text(
                "Elvis Barrionuevo",
              ),
              Text(
                "45454545",
              ),
              Text(
                "987 456 123",
              ),
              Text(
                "Av. Lima 1232",
              ),
              Text(
                "12/12/2024 12:22:22",
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getIncidents(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<IncidentModel> incidents = snap.data;
            incidents.forEach((item) {
              Marker myMarker = Marker(
                markerId: MarkerId(myMarkers.length.toString()),
                position: LatLng(item.latitud, item.longitud),
                onTap: () {
                  showIncidentDetail();
                },
              );
              myMarkers.add(myMarker);
            });

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-16.373062, -71.528785),
                zoom: 5,
              ),
              markers: myMarkers,
              // onTap: (LatLng position) {
              //   Marker marker = Marker(
              //     markerId: MarkerId(myMarkers.length.toString()),
              //     position: position,
              //   );
              //   myMarkers.add(marker);
              //   setState(() {});
              // },
            );
          }
          return loadingWidget;
        },
      ),
    );
  }
}
