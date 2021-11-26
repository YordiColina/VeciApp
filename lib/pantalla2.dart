
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/pantalla3.dart';
import 'package:proyecto_app/pantalla4.dart';
import 'package:proyecto_app/pantalla5.dart';

import 'main.dart';

class  pantalla2 extends StatelessWidget {
  //const pantalla2 ({Key? key}) : super(key: key);
  TextEditingController dato=TextEditingController();
  TextEditingController dato2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
          centerTitle: true,
          title: Text('Consulta tu Local')
      ),

      drawer: menu(),


      body: Column(

        children: [
          Container(
            child: TextField(controller:dato ,decoration: InputDecoration(hintText:'Ingrese Nombre o Categoria',hintStyle: TextStyle(fontSize: 22,)),),
          ),
          Container(
            child: TextField(controller:dato2 ,decoration: InputDecoration(hintText:'Ingrese Producto',hintStyle: TextStyle(fontSize: 22,)),),
          ),

          Container(
              child: ElevatedButton(
                onPressed: (){
                  print(dato.text);

                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>pantalla3(dato.text)));

                },
                child: Text('consultar por Nombre o Categoria'),)
          ),
          Container(

              child: ElevatedButton(
                onPressed: (){

                  print(dato2.text);

                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>pantalla3(dato2.text)));
                },
                child: Text('consultar por Producto'),
              ),

          ),
          Container(

            child: ElevatedButton(
              onPressed: (){


                Navigator.push(context, MaterialPageRoute(builder: (contex)=>pantalla5()));
              },
              child: Text('Listado de Negocios'),
            ),

          ),



        ],


      ),



    );
  }
}
