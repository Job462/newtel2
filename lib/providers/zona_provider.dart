import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/zona_model.dart';
import 'package:http/http.dart' as http;

class ZonaProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<Zona>> fetchZonas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/zonas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Zona> zonas = responseData.map((json) => Zona.fromJson(json)).toList();
        notifyListeners();
        return zonas;
      } else {
        throw Exception('Failed to load zonas');
      }
    } catch (error) {
      print('Error fetching zonas: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}