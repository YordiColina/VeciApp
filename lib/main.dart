import 'package:proyecto_app/mensaje.dart';
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
          backgroundColor: Colors.cyan[700],
           centerTitle: true,
          title: Text("INICIO"),
        ),


      drawer: menu(),
        body:

          Column(

            children: [
     /*         Center(

                child: Text(
                  'VeciApp',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.brown),


        ),
              ),*/
              Image.asset('assets/VECIAPP.jpeg',
              width: 500,)
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


////////////////////////////////////////////////MENU LATERAL ////////////////////////////////////////
class menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.cyan[700]
                ),
                child: Image.asset('assets/vecilogo.JPG')
            ),
            Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.house, size: 30, color: Colors.cyan[700]),
                    title: Text("Inicio"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search, size: 30, color: Colors.cyan[700]),
                    title: Text("Busqueda General"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla2()));
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.note_add,size: 30, color: Colors.cyan[700]),
                    title: Text("Registrarme"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>registroClientes()));
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.login,size: 30, color: Colors.cyan[700]),
                    enabled: true,
                    title: Text("Ingresar"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>comprobarCliente()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shop,size: 30, color: Colors.cyan[700]),
                    enabled: true,
                    title: Text("Negocios"),
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>pantalla5()));
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.email,size: 30, color: Colors.cyan[700]),
                    enabled: true,
                    title: Text("Notificaciones"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>mensaje()));
                    },
                  ),

                ]
            )
          ],
        )
    );
  }
}

