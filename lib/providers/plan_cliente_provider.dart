import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/plan_cliente_model.dart';
import 'package:http/http.dart' as http;

class PlanClienteProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<PlanCliente>> fetchPlanClientes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/plan_clientes'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<PlanCliente> planClientes = responseData.map((json) => PlanCliente.fromJson(json)).toList();
        notifyListeners();
        return planClientes;
      } else {
        throw Exception('Failed to load plan clientes');
      }
    } catch (error) {
      print('Error fetching plan clientes: $error');
      throw error;
    }
  }

  // Implementa los demás métodos de acuerdo a este ejemplo
}