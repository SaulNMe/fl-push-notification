import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';


class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) {
      print('=== FCM ===');
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (info) async {
        print('=== On Message ===');
        print(info);

        String argumento = 'no-data';
        if(Platform.isAndroid) {
          argumento = info['data']['coso'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);

      },
      onLaunch:  (info) async {
        print('=== On Launch ===');
        print(info);
        String argumento = 'no-data';
        if(Platform.isAndroid) {
          argumento = info['data']['coso'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
      onResume:  (info) async {
        print('=== On Resume ===');
        print(info);

        String argumento = 'no-data';
        if(Platform.isAndroid) {
          argumento = info['data']['coso'] ?? 'no-data';
        }
        _mensajesStreamController.sink.add(argumento);
      },
    );

  }

  dispose(){
    _mensajesStreamController?.close();
  }
}