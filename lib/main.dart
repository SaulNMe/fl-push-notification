import 'package:flutter/material.dart';
import 'package:push_notification/src/pages/home_page.dart';
import 'package:push_notification/src/pages/mensaje_page.dart';
import 'package:push_notification/src/providers/push_notifications_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorkey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();
    pushProvider.mensajes.listen((data) {
      print('Argumento de push');
      print(data);
      navigatorkey.currentState.pushNamed('Mensaje', arguments: data);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorkey,
      title: 'Material App',
      initialRoute: 'Home',
      routes: {
        'Home': (BuildContext context) => HomePage(),
        'Mensaje': (BuildContext context) => MensajePage(),
      },
    );
  }
}