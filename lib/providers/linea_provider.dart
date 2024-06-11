import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/linea_model.dart';
import 'package:http/http.dart' as http;

class LineaProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<Linea>> fetchLineas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/lineas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Linea> lineas = responseData.map((json) => Linea.fromJson(json)).toList();
        notifyListeners();
        return lineas;
      } else {
        throw Exception('Failed to load lineas');
      }
    } catch (error) {
      print('Error fetching lineas: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}