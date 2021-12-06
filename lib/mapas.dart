import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/main.dart';
import 'package:proyecto_app/pantalla3.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto_app/pantalla4.dart';
import 'package:permission_handler/permission_handler.dart';

class mapas extends StatefulWidget {

  final datosMapa_negocio negocio;
  const mapas({required this.negocio});

  @override
  _mapasState createState() => _mapasState();
}

class _mapasState extends State<mapas> {

  late GeoPoint pos = widget.negocio.geolocalizacion;

  @override
  Widget build(BuildContext context) {

    final posicion = CameraPosition(
        target: LatLng(pos.latitude, pos.longitude),
        zoom: 15
    );

    final Set<Marker> marcador = Set();
    String cedula="123456";

    marcador.add(
        Marker(
            markerId: MarkerId(cedula),
            position: LatLng(pos.latitude, pos.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(
                title: widget.negocio.nombre+" "+widget.negocio.categoria,
                snippet: widget.negocio.pagina
            )


        )
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Geolocalización"),
        ),
        body: ListView(
          children: [
            miCardImage(url: widget.negocio.foto, texto: widget.negocio.nombre+" "+widget.negocio.categoria),
            Container(
              width: 400,
              height: 600,
              child: GoogleMap(
                initialCameraPosition: posicion,
                scrollGesturesEnabled: true, //activar - desactivar mover el mapa
                zoomGesturesEnabled: false, //activar - desactivar zoom con la mano
                zoomControlsEnabled: true, // descativar botones zoom
                mapType: MapType.normal,
                markers: marcador,
              ),
            )
          ],
        )


    );
  }
}
