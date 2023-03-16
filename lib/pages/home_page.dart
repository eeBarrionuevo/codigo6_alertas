import 'package:codigo6_alertas/models/incident_model.dart';
import 'package:codigo6_alertas/pages/modals/register_incident_modal.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/ui/general/colors.dart';
import 'package:codigo6_alertas/widgets/general_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  showSendIncident() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RegisterIncidentModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBrandPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          showSendIncident();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/phone.svg",
                                      color: kBrandPrimaryColor,
                                    ),
                                    onPressed: () {
                                      Uri uriPhone = Uri(
                                          scheme: "tel",
                                          path: incidents[index]
                                              .datosCiudadano
                                              .telefono);
                                      launchUrl(uriPhone);
                                    },
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/map.svg",
                                      color: kBrandPrimaryColor,
                                    ),
                                    onPressed: () {
                                      Uri url = Uri.parse(
                                          "https://www.google.com/maps/search/?api=1&query=${incidents[index].latitud},${incidents[index].longitud}");
                                      // Uri url = Uri.parse(
                                      //     "http://maps.google.com/?q=${incidents[index].latitud},${incidents[index].longitud}");
                                      launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    },
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
