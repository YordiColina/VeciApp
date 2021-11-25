import 'package:proyecto_app/pantalla2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/registroClientes.dart';

import 'comprobarCliente.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState(){
    super.initState();

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.pink,
           centerTitle: true,
          title: Text("INICIO"),
        ),
        body:ListView.builder(

            itemBuilder: (BuildContext context, j) {
              return ListTile(
                  onTap: () {

                  },
                  title:
                  Container(decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/equipo1proyecto-98cd8.appspot.com/o/circuitos.jpg?alt=media&token=7cdd2768-8e55-4d4f-8a36-fce6c5576742'),
                      fit: BoxFit.cover,

                    ),
                  ),
                  )
              );
            }),


        floatingActionButton:FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>pantalla2( )));
            },
            label: Text('Siguiente'),
            icon:Icon(Icons.arrow_forward_sharp),


        ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.amberAccent
                ),
                child: Image.network('https://www.lifeder.com/wp-content/uploads/2018/06/mercado-negocios-empresas-630x420.jpg')
            ),
            Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined, size: 30, color: Colors.green),
                    title: Text("Consultar Personas"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla2()));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    title: Text("Registrar Cliente"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>registroClientes()));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    enabled: true,
                    title: Text("Actualizar Datos"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>comprobarCliente()));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    enabled: true,
                    title: Text("Registrar Pedido"),
                    //onTap: (){
                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>moduloPedido()));
                  //  },
                  )
                ]
            )
          ],
        )
    );
  }
}

