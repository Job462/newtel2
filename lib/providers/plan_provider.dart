import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/plan_model.dart';
import 'package:http/http.dart' as http;

class PlanProvider with ChangeNotifier {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<List<Plan>> fetchPlanes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/planes'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Plan> planes = responseData.map((json) => Plan.fromJson(json)).toList();
        notifyListeners();
        return planes;
      } else {
        throw Exception('Fallo la carga a planes');
      }
    } catch (error) {
      print('Error planes: $error');
      throw error;
    }
  }
}