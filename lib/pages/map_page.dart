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
              );
              myMarkers.add(myMarker);
            });

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-16.373062, -71.528785),
                zoom: 5,
              ),
              markers: myMarkers,
              onTap: (LatLng position) {
                Marker marker = Marker(
                  markerId: MarkerId(myMarkers.length.toString()),
                  position: position,
                );
                myMarkers.add(marker);
                setState(() {});
              },
            );
          }
          return loadingWidget;
        },
      ),
    );
  }
}
