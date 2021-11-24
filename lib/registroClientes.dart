import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registroClientes extends StatefulWidget {
  const registroClientes({Key? key}) : super(key: key);

  @override
  _registroClientesState createState() => _registroClientesState();
}

class _registroClientesState extends State<registroClientes> {
  final cedula=TextEditingController();
  final nombre=TextEditingController();
  final apellido=TextEditingController();
  final correo=TextEditingController();
  final celular=TextEditingController();

  CollectionReference clientes =FirebaseFirestore.instance.collection('Clientes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resgistro de Clientes"),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: cedula,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(Icons.assignment_rounded,size: 25,color: Colors.blue),
                    hintText: "Digite numero de cedula",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: nombre,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    icon: Icon(Icons.assignment_rounded,size: 25,color: Colors.blue),
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
                    icon: Icon(Icons.assignment_rounded,size: 25,color: Colors.blue),
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
                    icon: Icon(Icons.assignment_rounded,size: 25,color: Colors.blue),
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
                    icon: Icon(Icons.assignment_rounded,size: 25,color: Colors.blue),
                    hintText: "Digite numero de celular",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: (){
                if(cedula.text.isEmpty || nombre.text.isEmpty || apellido.text.isEmpty || correo.text.isEmpty || celular.text.isEmpty){
                  print("Campos Vacios");

                }else{
                  clientes.doc(cedula.text).set({
                    "nombre": nombre.text,
                    "apellidos": apellido.text,
                    "correo": correo.text,
                    "celular": celular.text
                  });
                }
              },
              child: Text("Registrar",style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          )
        ],
      ),
    );
  }
}
