import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/pantalla4.dart';

import 'main.dart';

class pantalla3 extends StatefulWidget {
  final String criterio;
  const pantalla3(this.criterio,{Key? key}) : super(key: key);
  @override
  _pantalla3State createState() => _pantalla3State();
}
class _pantalla3State extends State<pantalla3> {



  List pers = [];

  void initState() {
    super.initState();
    //getCriterioGustos();
    getCriterioCategory();
    getCriterioName();
    getCriterio();
    getCriterio2();
    getCriterio3();
    getCriterio4();
  }

  void getCriterioCategory() async {
    CollectionReference datos = FirebaseFirestore.instance.collection(
        'negocios');
    QuerySnapshot negocios2 = await datos.where(
        'categoria', isEqualTo: widget.criterio).get();
    if (negocios2.docs.length != 0) {
      for (var per in negocios2.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }

  void getCriterioName() async {
    CollectionReference datos = FirebaseFirestore.instance.collection(
        'negocios');
    QuerySnapshot negocios2 = await datos.where(
        'nombre', isEqualTo: widget.criterio).get();
    if (negocios2.docs.length != 0) {
      for (var per in negocios2.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }


  /*void getCriterioGustos() async {
    CollectionReference datos = FirebaseFirestore.instance.collection("gustos");
    QuerySnapshot gustos = await datos.where(
        "nombre", isEqualTo: widget.criterio).get();
    if (gustos.docs.length != 0) {
      for (var per in gustos.docs) {
        print(per.data());
        setState(() {
          gustosLista.add(per);
        });
      }
    }
  }*/
  void getCriterio() async {
    CollectionReference datos = FirebaseFirestore.instance.collection(
        'negocios');

    QuerySnapshot negocios1 = await datos.where(
        "producto1", isEqualTo: widget.criterio).get();

    if (negocios1.docs.length != 0) {
      for (var per in negocios1.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }

  void getCriterio2() async {
    CollectionReference datos2 = FirebaseFirestore.instance.collection(
        'negocios');
    QuerySnapshot negocios2 = await datos2.where(
        "producto2", isEqualTo: widget.criterio).get();

    if (negocios2.docs.length != 0) {
      for (var per in negocios2.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }

  void getCriterio3() async {
    CollectionReference datos3 = FirebaseFirestore.instance.collection(
        'negocios');
    QuerySnapshot negocios3 = await datos3.where(
        "producto3", isEqualTo: widget.criterio).get();
    if (negocios3.docs.length != 0) {
      for (var per in negocios3.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }

  void getCriterio4() async {
    CollectionReference datos4 = FirebaseFirestore.instance.collection(
        'negocios');
    QuerySnapshot negocios4 = await datos4.where(
        "producto4", isEqualTo: widget.criterio).get();

    if (negocios4.docs.length != 0) {
      for (var per in negocios4.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }
  }

    /*  String id;
    CollectionReference datos2 = FirebaseFirestore.instance.collection("Personas");
    for(var i=0;i<gustosLista.length;i++){
      id=gustosLista[i]['persona'];
      QuerySnapshot persona = await datos2.where(FieldPath.documentId, isEqualTo: id).get();
      if(persona.docs.length>0){
        for(var pers in persona.docs){
          setState(() {
            negociosLista.add(pers.data());
            print(pers.data());
          });

        }
      }else{ print('No encontro personas para ese gusto');}
    }*/


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          title: Text("El Resultado de : " + widget.criterio),
        ),

        drawer: menu(),


        body: ListView.builder(
            itemCount: pers.length,
            itemBuilder: (BuildContext context, j) {
              return ListTile(
                  onTap: () {
                    print(pers[j]);
                    datosNegocio N = datosNegocio(pers[j]['nombre'],
                        pers[j]['categoria'],
                        pers[j]['direccion'], pers[j]['foto'],pers[j]['celular'],
                        pers[j]['telefono'], pers[j]['pagina'],pers[j]['producto1'],
                    pers[j]['producto2'],pers[j]['producto3'],pers[j]['producto4'],
                    pers[j]['geolocalizacion'].toString());
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => pantalla4(negocios: N)));
                  },
                  title: miCardImage(url: pers[j]['foto'],
                      texto: pers[j]['nombre'] + "\n telefonos: " +
                          pers[j]['telefono'] +" - "+pers[j]['celular'] +'\n Direccion:' +
                          pers[j]['direccion'])
              );
            }),
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

class datosNegocio{

  String nombre="";
  String categoria="";
  String direccion="";
  String foto="";
  String celular="";
  String telefono ="";
  String pagina="";
  String producto1="";
  String producto2="";
  String producto3="";
  String producto4="";
  String geolocalizacion="";

  datosNegocio(nombre,categoria,direccion,foto,celular,telefono,pagina,producto1,producto2,producto3,producto4,geolocalizacion){
    this.nombre=nombre;
    this.categoria=categoria;
    this.direccion=direccion;
    this.foto=foto;
    this.celular=celular;
    this.telefono=telefono;
    this.pagina=pagina;
    this.producto1=producto1;
    this.producto2=producto2;
    this.producto3=producto3;
    this.producto4=producto4;
    this.geolocalizacion=geolocalizacion;
  }


}

class datosPersona{

  String nombre="";
  String apellido="";
  String correo="";
  String foto="";
  int edad=0;
  String web="";

  datosPersona(nombre,apellido,correo,foto,edad,web){
    this.nombre=nombre;
    this.apellido=apellido;
    this.correo=correo;
    this.foto=foto;
    this.web=web;
  }


}