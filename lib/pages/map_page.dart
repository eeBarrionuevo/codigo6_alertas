import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> myMarkers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-16.373062, -71.528785),
          zoom: 14,
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
      ),
    );
  }
}
