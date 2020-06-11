import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Mensaje"),),
      body: Center(child: Text("Mensaje Page $data"),),
    );
  }
}