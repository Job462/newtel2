import 'package:flutter/material.dart';
import 'package:newtel_app2/screens/cobranza/cobranzas_screen.dart';
import 'package:provider/provider.dart';
import 'package:newtel_app2/providers/cliente_provider.dart';
import 'package:newtel_app2/screens/home/home_screen.dart';
import 'package:newtel_app2/screens/clientes/clientes_screen.dart';
import 'package:newtel_app2/screens/facturas/facturas_screen.dart';
import 'package:newtel_app2/screens/lineas/lineas_screen.dart';
import 'package:newtel_app2/screens/planes/planes_screen.dart';
import 'package:newtel_app2/screens/zonas/zonas_screen.dart';
import 'package:newtel_app2/screens/actividades/actividades_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newtel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newtel App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Newtel App', style: TextStyle(color: Colors.white, fontSize: 24)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Clientes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Cobranza'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CobranzaScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Actividades'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActividadesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Planes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Zonas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZonasScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Líneas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineasScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reportes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a Newtel App'),
      ),
    );
  }
}
