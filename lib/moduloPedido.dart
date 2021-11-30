

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_app/registrarPedido.dart';

import 'listaPersonas.dart';
import 'main.dart';

class moduloPedido extends StatefulWidget {
  final String id;
  const moduloPedido({required this.id});

  @override
  _moduloPedidoState createState() => _moduloPedidoState();
}

class _moduloPedidoState extends State<moduloPedido> {
  final correo = TextEditingController();
  final password = TextEditingController();
  CollectionReference cliente =
  FirebaseFirestore.instance.collection("Clientes");

  CollectionReference aux= FirebaseFirestore.instance.collection("Productos");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comprobar Cliente"),
        ),
        drawer: menu(),
        body: ListView(children: [
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
                    hintText: "Digite Su Correo",
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
                    hintText: "Digite su contraseña",
                    hintStyle: TextStyle(color: Colors.black12)),
              )),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                String cedula;
                String id2="";
                List listaNegocios = [];
                QuerySnapshot ingreso = await cliente
                    .where("correo", isEqualTo: correo.text)
                    .where("password", isEqualTo: password.text)
                    .get();
                List listaCliente = [];


                if (ingreso.docs.length > 0) {
                  for (var cli in ingreso.docs) {
                    listaCliente.add(cli.data());
                  }
             QuerySnapshot ingreso2 = await aux.where('negocio',isEqualTo:widget.id).get();

                if (ingreso2.docs.length > 0) {
                  for (var cli in ingreso2.docs) {
                    listaNegocios.add(cli.data());

                  }
                }

                cedula = listaCliente[0]['id'];
                id2=listaNegocios[0]['negocio'];
                print(id2);

                  Navigator.push(context, MaterialPageRoute (builder: (context) =>registrarPedido(cedula: cedula,id:id2 )));
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

