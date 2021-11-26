
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'comprobarCliente.dart';
import 'main.dart';


class actualizarCliente extends StatefulWidget {
  final datosCliente cliente;
  const actualizarCliente({required this.cliente});

  @override
  _actualizarClienteState createState() => _actualizarClienteState();
}

class _actualizarClienteState extends State<actualizarCliente> {


  final cedula=TextEditingController();
final nombre=TextEditingController();
final apellido=TextEditingController();
final correo=TextEditingController();
final celular=TextEditingController();


CollectionReference clientes =FirebaseFirestore.instance.collection('Clientes');


  @override
  Widget build(BuildContext context) {
    String cedula = widget.cliente.cedula;
    nombre.text = widget.cliente.nombre;
    apellido.text = widget.cliente.apellido;
    correo.text = widget.cliente.correo;
    celular.text = widget.cliente.celular;

    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Datos: " + widget.cliente.nombre),
      ),


      drawer: menu(),


      body: ListView(
        children: [

          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: nombre,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(
                        Icons.assignment_rounded, size: 25, color: Colors.blue),
                    hintText: "Digite el nombre",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: apellido,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(
                        Icons.assignment_rounded, size: 25, color: Colors.blue),
                    hintText: "Digite los apellidos",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: correo,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(
                        Icons.assignment_rounded, size: 25, color: Colors.blue),
                    hintText: "Digite su correo",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: celular,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(
                        Icons.assignment_rounded, size: 25, color: Colors.blue),
                    hintText: "Digite numero de celular",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),


          Row(
            children: [Container(
              child: ElevatedButton(
                  onPressed: () {


                    clientes.doc(cedula.text).update({
                      "nombre": nombre.text,
                      "apellidos": apellido.text,
                      "correo": correo.text,
                      "celular": celular.text
                    });

                    Fluttertoast.showToast(
                        msg: "Datos Actualizados Correctamente.",
                        fontSize: 20,
                        backgroundColor: Colors.red,
                        textColor: Colors.lightGreen,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER);
                  },
                  child: Text("Actualizar datos")),
            ),
              ElevatedButton(
                  onPressed: () {}, child: Text("Dar de baja usuario"))
            ],
          )
        ],
      ),
    );
  }}