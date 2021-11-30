import 'package:proyecto_app/pantalla2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_app/pantalla5.dart';
import 'package:proyecto_app/registroClientes.dart';

import 'comprobarCliente.dart';
import 'moduloPedido.dart';

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
      backgroundColor: Colors.cyan[50],

        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
           centerTitle: true,
          title: Text("INICIO"),
        ),


      drawer: menu(),
        body:

          Column(

            children: [
              Center(

                child: Text(
                  'VeciApp',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.brown),







        ),
              ),
              Image.network('https://firebasestorage.googleapis.com/v0/b/equipo1proyecto-98cd8.appspot.com/o/imagenes%20proyecto%20veci%20app%2Fnegocio.png?alt=media&token=b22f031e-7400-4ff2-90f2-015ceaf38447',
                alignment: Alignment.center ,)
            ],
          ),

        /*floatingActionButton:FloatingActionButton.extended(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder:(context)=>pantalla2( )));
            },
            label: Text('Siguiente'),
            icon:Icon(Icons.arrow_forward_sharp),


        )*/


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
                    color: Colors.cyan[900]
                ),
                child: Image.network('https://firebasestorage.googleapis.com/v0/b/equipo1proyecto-98cd8.appspot.com/o/imagenes%20proyecto%20veci%20app%2Fnegocio.png?alt=media&token=b22f031e-7400-4ff2-90f2-015ceaf38447')
            ),
            Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined, size: 30, color: Colors.green),
                    title: Text("Busqueda General"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla2()));
                    },
                  ),

                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    title: Text("Registrarme"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>registroClientes()));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    enabled: true,
                    title: Text("Ingresar"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>comprobarCliente()));
                    },
                  ),
                  ListTile(
                    trailing: Icon(Icons.account_box,size: 30, color: Colors.green),
                    enabled: true,
                    title: Text("Mis Negocios"),
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla5()));
                    },
                  ),


                ]
            )
          ],
        )
    );
  }
}

