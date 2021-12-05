import 'package:flutter/material.dart';
import 'package:proyecto_app/RecibiendoMensaje.dart';

class mensaje extends StatefulWidget {
  const mensaje({Key? key}) : super(key: key);

  @override
  _mensajeState createState() => _mensajeState();
}

class _mensajeState extends State<mensaje> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  final objeto= new RecibiendoMensaje();
  objeto.Notificaciones();



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones')
      ),
    );
  }
}
