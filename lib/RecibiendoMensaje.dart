import 'package:firebase_messaging/firebase_messaging.dart';

class RecibiendoMensaje{

  FirebaseMessaging mensaje=FirebaseMessaging.instance;

Notificaciones() {
  mensaje.requestPermission();
  mensaje.getToken().then((token)
  {
  print('-------------token-------------');
      print(token);
});


  FirebaseMessaging.onMessage.listen((RemoteMessage message) {

  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {


  });

  FirebaseMessaging.onBackgroundMessage((RemoteMessage message)async => {


  });


}


}