
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
        backgroundColor: Colors.cyan[700],
          centerTitle: true,
          title: Text('¿Que negocio buscas?')
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

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


    ),
    //

                onPressed: (){
                  print(dato.text);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla3(dato.text)));
                },
                child: Text('consultar por Nombre o Categoria',
              style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,
              ),
                ),


              )
          ),




          Container(

              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 70.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


                ),

                onPressed: (){

                  print(dato2.text);

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla3(dato2.text)));
                },
                child: Text('consultar por Producto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,
                  ),
                ),
              ),

          ),
          Container(

            child: ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 80.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


              ),
              onPressed: (){


                Navigator.push(context, MaterialPageRoute(builder: (contex)=>pantalla5()));
              },
              child: Text('Listado de Negocios',
                style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,
                ),
              ),
            ),

          ),



        ],


      ),



    );
  }
}
