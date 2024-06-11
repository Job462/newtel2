import 'package:flutter/material.dart';

class CobranzaScreen extends StatefulWidget {
  @override
  _CobranzaScreenState createState() => _CobranzaScreenState();
}

class _CobranzaScreenState extends State<CobranzaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: Center(
        child: Text('Pantalla de Clientes'),
      ),
    );
  }
}
