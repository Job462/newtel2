import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/suspendido_model.dart';
import 'package:http/http.dart' as http;

class SuspendidoProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<Suspendido>> fetchSuspendidos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/suspendidos'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Suspendido> suspendidos = responseData.map((json) => Suspendido.fromJson(json)).toList();
        notifyListeners();
        return suspendidos;
      } else {
        throw Exception('Failed to load suspendidos');
      }
    } catch (error) {
      print('Error fetching suspendidos: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}