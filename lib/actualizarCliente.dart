
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
final password=TextEditingController();



CollectionReference clientes =FirebaseFirestore.instance.collection('Clientes');


  @override
  Widget build(BuildContext context) {
    cedula.text = widget.cliente.cedula;
    nombre.text = widget.cliente.nombre;
    apellido.text = widget.cliente.apellido;
    correo.text = widget.cliente.correo;
    celular.text = widget.cliente.celular;
    password.text = widget.cliente.password;
    cedula.text= widget.cliente.cedula;



    void limpiar(){
      cedula.text=""; nombre.text=""; apellido.text=""; correo.text=""; celular.text=""; password.text=""; cedula.text="";
    }

    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
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
                    fillColor: Colors.cyan[700],
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan[700]),
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
                    fillColor: Colors.cyan[700],
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan[700]),
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
                    fillColor: Colors.cyan[700],
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan[700]),
                    hintText: "Digite su Correo",
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
                    fillColor: Colors.cyan[700],
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan[700]),
                    hintText: "Digite su Celular",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: password,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.cyan[700],
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan[700]),
                    hintText: "Digite su Contraseña",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: cedula,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    fillColor: Colors.cyan,
                    filled: true,
                    icon: Icon(
                        Icons.drag_indicator, size: 25, color: Colors.cyan),
                    hintText: "ingrese su cedula",
                    hintStyle: TextStyle(color: Colors.black12)
                ),
              )
          ),


          Row(
            children: [Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              alignment: Alignment.center,
              child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


                  ),


                  onPressed: ()async {
                    QuerySnapshot existe = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();
                    if(cedula.text.isEmpty || nombre.text.isEmpty || apellido.text.isEmpty || correo.text.isEmpty || celular.text.isEmpty){
                      Fluttertoast.showToast(msg: "Campos Vacios.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                          toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }else{
                      clientes.doc(cedula.text).update({
                        "nombre": nombre.text,
                        "apellidos": apellido.text,
                        "correo": correo.text,
                        "celular": celular.text,
                        "password":password.text,
                        "confirmacion":password.text
                      });
                      limpiar();
                      Fluttertoast.showToast(msg: "Datos Actualizados Correctamente.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                          toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }
                  },
                  child: Text("Actualizar datos")),
            ),


              Container(
                padding: EdgeInsets.only(left: 0.0, right: 30.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


                    ),

                    onPressed: ()  {

                      if(cedula.text.isEmpty){
                        Fluttertoast.showToast(msg: "Campos Vacios.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                            toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                      }else
                      {
                        clientes.doc(cedula.text).delete();
                        limpiar();
                        Fluttertoast.showToast(msg: "Cliente Eliminado Exitosamente.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                            toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                      }







                    }, child: Text("Dar de baja usuario")),
              )


       ], ),
        ],
      ),
    );
  }}