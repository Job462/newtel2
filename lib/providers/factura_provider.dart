import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/factura_model.dart';
import 'package:http/http.dart' as http;

class FacturaProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<Factura>> fetchFacturas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/facturas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Factura> facturas = responseData.map((json) => Factura.fromJson(json)).toList();
        notifyListeners();
        return facturas;
      } else {
        throw Exception('Failed to load facturas');
      }
    } catch (error) {
      print('Error fetching facturas: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}