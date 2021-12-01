import 'package:firebase_messaging/firebase_messaging.dart';

class recibiendoMensajes{

  FirebaseMessaging mensaje=FirebaseMessaging.instance;

  notificaciones() {
    mensaje.requestPermission();
    mensaje.getToken().then((token) => {
    print("--------TOKEN--------"),
    print(token),
    });


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //aplicacian esta bierta
    });
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async{
      //app cerrada
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage messge) {
      //segundo plano

    });





  }
}