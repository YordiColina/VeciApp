import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/pantalla3.dart';
import 'package:proyecto_app/pantalla4.dart';

import 'main.dart';

class pantalla5 extends StatefulWidget {
  const pantalla5({Key? key}) : super(key: key);


  @override
  _pantalla5State createState() => _pantalla5State();
}

class _pantalla5State extends State<pantalla5> {

  List datos_negocios=[];
  void initState(){
    super.initState();
    getNegocios();
  }
  void getNegocios() async {
    CollectionReference datos= FirebaseFirestore.instance.collection("negocios"); //Conecte a la colleccion
    QuerySnapshot negocios= await datos.get(); //Traer todas las personas

    if(negocios.docs.length>0){ //Trae datos
      print("Trae Datos");
      for(var doc in negocios.docs){
        print(doc.data());

          datos_negocios.add(doc.data());

            setState(() {

            });

      }
    }
    else{
      print("Ha fallado.......");
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[50],
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],



          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Listado de Negocios"),
          centerTitle: true,
        ),

      drawer: menu(),


      body:
        ListView.builder(
            itemCount: datos_negocios.length,
            itemBuilder: (BuildContext context, j) {
              return ListTile(
                  onTap: () {
                    print(datos_negocios[j]);
                    datosNegocio N = datosNegocio(datos_negocios[j]['id'],datos_negocios[j]['nombre'],
                        datos_negocios[j]['categoria'],
                        datos_negocios[j]['direccion'], datos_negocios[j]['foto'],datos_negocios[j]['celular'],
                        datos_negocios[j]['telefono'], datos_negocios[j]['pagina'],datos_negocios[j]['producto1'],
                        datos_negocios[j]['producto2'],datos_negocios[j]['producto3'],datos_negocios[j]['producto4'],
                        datos_negocios[j]['geolocalizacion'].toString());
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => pantalla4(negocios: N)));
                  },
                  title: miCardImage(url: datos_negocios[j]['foto'],
                      texto: datos_negocios[j]['nombre'] + "\n telefonos: " +
                          datos_negocios[j]['telefono'] +" - "+datos_negocios[j]['celular'] +'\n Direccion:' +
                          datos_negocios[j]['direccion'])
              );
            }),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class miCardImage extends StatelessWidget {
  final String url;
  final String texto;

  const miCardImage({required this.url, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        margin: EdgeInsets.all(20),
        elevation: 10,
        color: Colors.blueAccent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Column(
              children: [
                Image.network(url),
                Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.blueAccent,
                    child: Text(texto,style: TextStyle(fontSize: 20, color: Colors.white),textAlign: TextAlign.center)

                )
              ]
          ),
        )
    );
  }
}

