import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'comprobarCliente.dart';
import 'main.dart';

class registroClientes extends StatefulWidget {
  const registroClientes({Key? key}) : super(key: key);

  @override _registroClientesState createState() => _registroClientesState();
}

 class _registroClientesState extends State<registroClientes> {
   String camara = "";
   String almacen = "";
   File? imagen;

   FirebaseStorage _storage = FirebaseStorage.instance;
   final picker = ImagePicker();

   Future selimagen(op) async {
     var pickedFile;
     if (op == 1) {
       pickedFile = await picker.pickImage(source: ImageSource.camera);
       /*imagen= (await picker.pickImage(source: ImageSource.camera)) as File?;
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("imagen" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(pickedFile);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        return res;
      });*/
     } else {
       pickedFile = await picker.pickImage(source: ImageSource.gallery);
       /* imagen=pickedFile;
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("image2" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(imagen!);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
        return res;
      });
*/
     }
     setState(() {
       if (pickedFile != null) {
         imagen = File(pickedFile.path);
       } else {
         print('No seleccionaste ninguna Foto');
       }
     });
     Navigator.of(context).pop();
   }


   final cedula=TextEditingController();
   final nombre=TextEditingController();
   final apellido=TextEditingController();
   final correo=TextEditingController();
   final celular=TextEditingController();
   final password=TextEditingController();
   final confirmacion=TextEditingController();
   List pers = [];
   void limpiar(){
   cedula.text=""; nombre.text=""; apellido.text=""; correo.text=""; celular.text=""; password.text="";confirmacion.text="";
   }

   CollectionReference clientes =FirebaseFirestore.instance.collection('Clientes');


   opciones(contex){

   showDialog(context: context,
   builder: (BuildContext contex){
   return AlertDialog(
   contentPadding: EdgeInsets.all(0),
   content: SingleChildScrollView(
   child: Column(
   children:[
   InkWell(
   onTap: (){
   selimagen(1);
   },
   child: Container(
   padding: EdgeInsets.all(20),
   decoration:BoxDecoration(
   border: Border(bottom: BorderSide(width: 1,color:Colors.grey))
   ),
   child: Row(
   children: [
   Expanded(child: Text('Tomar una Foto',style:TextStyle(fontSize: 16)
   ,

   ),

   ),
   Icon(Icons.camera_alt,color:Colors.blue)
   ],
   ),
   ),
   ),
   InkWell(
   onTap: (){
   selimagen(2);
   },
   child: Container(
   padding: EdgeInsets.all(20),

   child: Row(
   children: [
   Expanded(child: Text('Seleccionar una Foto',style:TextStyle(fontSize: 16)
   ,

   ),

   ),
   Icon(Icons.image,color:Colors.blue)
   ],
   ),
   ),
   ),
   InkWell(
   onTap: (){
   Navigator.of(context).pop();
   },
   child: Container(
   padding: EdgeInsets.all(20),
   decoration: BoxDecoration(color: Colors.redAccent),
   child: Row(
   children: [
   Expanded(child: Text('Cancelar',style:TextStyle(fontSize: 16,color:Colors.white )
   ,
   textAlign:TextAlign.center ,
   ),

   ),

   ],
   ),
   ),
   )

   ]

   ),
   ),
   );
   }
   );
   }

   @override
   Widget build(BuildContext context) {
   return Scaffold(
   backgroundColor: Colors.cyan[50],
   appBar: AppBar(
   backgroundColor: Colors.cyan[700],
   title: Text("Registrate"),
   centerTitle: true,
   ),

   drawer: menu(),


   body: ListView(
   children: [
   Padding(padding: EdgeInsets.all(20),
   child: Column(
   children: [
   ElevatedButton(onPressed:(){

   opciones(context );

   }
   , child: Text('seleccione una imagen')
   ),
   SizedBox(height: 30,),
   imagen==null?Center() : Image.file(imagen!)
   ],

   ),

   ),
   Container(
   padding: EdgeInsets.all(20.0),
   child: TextField(
   controller: cedula,
   style: TextStyle(color: Colors.white),
   decoration: InputDecoration(
   fillColor: Colors.cyan[700],
   filled: true,
   icon: Icon(Icons.person_pin,size: 25,color: Colors.cyan[700]),
   hintText: "Digite numero de cedula",
   hintStyle: TextStyle(color: Colors.black38)
   ),
   )
   ),
   Container(
   padding: EdgeInsets.all(20.0),
   child: TextField(
   controller: nombre,
   style: TextStyle(color: Colors.white),
   decoration: InputDecoration(
   fillColor: Colors.cyan[700],
   filled: true,
   icon: Icon(Icons.sentiment_satisfied_alt,size: 25,color: Colors.cyan[700]),
   hintText: "Digite el nombre",
   hintStyle: TextStyle(color: Colors.black38)
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
   icon: Icon(Icons.spellcheck,size: 25,color: Colors.cyan[700]),
   hintText: "Digite los apellidos",
   hintStyle: TextStyle(color: Colors.black38)
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
   icon: Icon(Icons.alternate_email,size: 25,color: Colors.cyan[700]),
   hintText: "Digite su correo",
   hintStyle: TextStyle(color: Colors.black38)
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
   icon: Icon(Icons.phone_enabled,size: 25,color: Colors.cyan[700]),
   hintText: "Digite numero de celular",
   hintStyle: TextStyle(color: Colors.black38)
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
   icon: Icon(Icons.lock,size: 25,color: Colors.cyan[700]),
   hintText: "Digite su contraseña",
   hintStyle: TextStyle(color: Colors.black38)
   ),
   )
   ),
   Container(
   padding: EdgeInsets.all(20.0),
   child: TextField(
   controller: confirmacion,
   style: TextStyle(color: Colors.white),
   decoration: InputDecoration(
   fillColor: Colors.cyan[700],
   filled: true,
   icon: Icon(Icons.lock,size: 25,color: Colors.cyan[700]),
   hintText: "Confirme su Contraseña",
   hintStyle: TextStyle(color: Colors.black38)
   ),
   )
   ),
   Row(
   mainAxisAlignment: MainAxisAlignment.end,
   children: [
   Container(
   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
   alignment: Alignment.center,
   child: ElevatedButton(
   style: ButtonStyle(
   backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
   padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)),
   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


   ),


   onPressed: () async {
   if(cedula.text.isEmpty || nombre.text.isEmpty || apellido.text.isEmpty || correo.text.isEmpty || celular.text.isEmpty|| password.text.isEmpty|| confirmacion.text.isEmpty){
   print("Campos Vacios");
   Fluttertoast.showToast(msg: "Campos Vacios", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
   }else{
   QuerySnapshot existe = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();

   if(existe.docs.length>0){
   Fluttertoast.showToast(msg: "El cliente ya Existe.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
   limpiar();
   }else{
   clientes.doc(cedula.text).set({
   "foto":camara,

   "nombre": nombre.text,
   "apellidos": apellido.text,
   "correo": correo.text,
   "celular": celular.text,
   "password":password.text,
   "confirmacion": confirmacion.text
   });
   /* void getCriterio3() async {
                          String respuesta=" ";
                          CollectionReference datos3 = FirebaseFirestore.instance.collection(
                              'negocios');
                          QuerySnapshot negocios3 = await datos3.where(
                              "password", isEqualTo: confirmacion.text).get();
                          if (negocios3.docs.length != 0) {
                            for (var per in negocios3.docs) {
                              print(per.data());
                              setState(() {
                                pers.add(per);
                                respuesta=pers['password'].toString();
                              }
                              );
                            }
                          }
                        }*/

   QuerySnapshot inserto = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();

   limpiar();
   if(inserto.docs.length>0){
   Fluttertoast.showToast(msg: "Se Registo el Cliente Exitosamente.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
   }else{
   Fluttertoast.showToast(msg: "No se registro el Cliente.", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
   }

   }

   }
   setState(() {

   });
   },
   child: Text("Registrar",style: TextStyle(color: Colors.black38, fontSize: 25)),
   ),
   ),
   Container(
   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
   alignment: Alignment.center,
   child: ElevatedButton(

   style: ButtonStyle(
   backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
   padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)),
   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),


   ),

   onPressed: () async {
   if(cedula.text.isEmpty){
   Fluttertoast.showToast(msg: "Digite la cedula.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
   toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
   }else{
   List lista=[];
   var id;
   var ced=cedula.text;
   QuerySnapshot consulta = await clientes.where(FieldPath.documentId, isEqualTo: cedula.text).get();
   if(consulta.docs.length>0){
   for(var doc in consulta.docs){

   lista.add(doc.data());
   }
   Fluttertoast.showToast(msg: "Cargando Datos.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
   toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
   Image.network(lista[0]['foto']);
   cedula.text=ced;
   nombre.text=lista[0]['nombre'];
   apellido.text= lista[0]['apellidos'];
   correo.text= lista[0]['correo'];
   celular.text= lista[0]['celular'];
   }
   else{
   limpiar();
   Fluttertoast.showToast(msg: "El Cliente no se encontro.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
   toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
   }
   }
   },
   child: Text("Consultar",style: TextStyle(color: Colors.black38, fontSize: 25)),
   ),
   )
   ],
   ),
   /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){
                    if(cedula.text.isEmpty || nombre.text.isEmpty || apellido.text.isEmpty || correo.text.isEmpty || celular.text.isEmpty){
                      Fluttertoast.showToast(msg: "Campos Vacios.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                          toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }else{
                      clientes.doc(cedula.text).update({
                        "nombre": nombre.text,
                        "apellidos": apellido.text,
                        "correo": correo.text,
                        "celular": celular.text
                      });
                      limpiar();
                      Fluttertoast.showToast(msg: "Datos Actualizados Correctamente.", fontSize: 20, backgroundColor: Colors.red, textColor: Colors.lightGreen,
                          toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                    }
                  },
                  child: Text("Actualizar",style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){
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
                  },
                  child: Text("Eliminar",style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>comprobarCliente()));
        },
        child: Icon(Icons.arrow_forward_sharp,size: 30,color: Colors.white),
      ),*/
   ])

   );
   }
   }

