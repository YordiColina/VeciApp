import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'actualizarCliente.dart';
import 'main.dart';


class comprobarCliente extends StatefulWidget {
  const comprobarCliente({Key? key}) : super(key: key);

  @override
  _comprobarClienteState createState() => _comprobarClienteState();
}

class _comprobarClienteState extends State<comprobarCliente> {
  final correo = TextEditingController();
  final password = TextEditingController();
  CollectionReference cliente =
  FirebaseFirestore.instance.collection("Clientes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Text("Iniciar Sesion"),
          centerTitle: true,
        ),

        drawer: menu(),


        body: ListView(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 105.0, right: 15.0, bottom: 0.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/equipo1proyecto-98cd8.appspot.com/o/imagenes%20proyecto%20veci%20app%2Flogin2.png?alt=media&token=60a1bb6f-b789-4531-9031-a7a785af3abe'),
                  radius: 70,
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: correo,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(Icons.assignment_rounded,
                        size: 25, color: Colors.blue),
                    hintText: "Digite su Correo Electronico ",
                    hintStyle: TextStyle(color: Colors.black12)),
              )),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: password,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(Icons.assignment_rounded,
                        size: 25, color: Colors.blue),
                    hintText: "Digite su Contraseña",
                    hintStyle: TextStyle(color: Colors.black12)),
              )),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                QuerySnapshot ingreso = await cliente
                    .where("correo", isEqualTo: correo.text)
                    .where("password", isEqualTo: password.text)
                    .get();
                List listaCliente = [];
                if (ingreso.docs.length > 0) {
                  for (var cli in ingreso.docs) {
                    listaCliente.add(cli.data());
                  }
                  datosCliente dCli = datosCliente(
                      password.text, listaCliente[0]['nombre'],
                      listaCliente[0]['apellidos'], listaCliente[0]['correo'],
                      listaCliente[0]['celular'],listaCliente[0]['password']);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => actualizarCliente(cliente: dCli)));
                  Fluttertoast.showToast(msg: "Cargando Datos",
                      fontSize: 20,
                      backgroundColor: Colors.red,
                      textColor: Colors.lightGreen,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                } else {
                  Fluttertoast.showToast(msg: "Datos Incorrectos",
                      fontSize: 20,
                      backgroundColor: Colors.red,
                      textColor: Colors.lightGreen,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER);
                }
              },
              child: Text("Verificar",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          )
        ]));
  }
}

class datosCliente {

  String cedula = "";
  String nombre = "";
  String apellido = "";
  String correo = "";
  String celular = "";
  String password = "";


  datosCliente(cedula, nombre, apellido, correo, celular,password) {
    this.nombre = nombre;
    this.apellido = apellido;
    this.correo = correo;
    this.cedula = cedula;
    this.celular = celular;
    this.password=password;

  }


}
