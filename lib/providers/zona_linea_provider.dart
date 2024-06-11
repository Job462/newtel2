import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/zona_linea_model.dart';
import 'package:http/http.dart' as http;

class ZonaLineaProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<ZonaLinea>> fetchZonaLineas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/zona_lineas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<ZonaLinea> zonaLineas = responseData.map((json) => ZonaLinea.fromJson(json)).toList();
        notifyListeners();
        return zonaLineas;
      } else {
        throw Exception('Failed to load zona lineas');
      }
    } catch (error) {
      print('Error fetching zona lineas: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}