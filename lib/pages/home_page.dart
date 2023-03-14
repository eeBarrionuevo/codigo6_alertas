import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/widgets/general_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                const Text(
                  "Alertas generales",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                FutureBuilder(
                  future: apiService.getIncidents(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<IncidentModel> incidents = snap.data;
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: incidents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 12,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                incidents[index].tipoIncidente.titulo,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    incidents[index].datosCiudadano.nombres,
                                  ),
                                  Text(
                                    "DNI: ${incidents[index].datosCiudadano.dni}",
                                  ),
                                  Text(
                                    "${incidents[index].fecha} ${incidents[index].hora}",
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return loadingWidget;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
