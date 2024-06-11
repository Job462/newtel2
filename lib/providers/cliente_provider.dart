import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newtel_app2/models/cliente_model.dart';
import 'package:http/http.dart' as http;

class ClienteProvider with ChangeNotifier {
  final String baseUrl = 'https://tu-api.com';

  Future<List<Cliente>> fetchClientes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/clientes'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Cliente> clientes = responseData.map((json) => Cliente.fromJson(json)).toList();
        notifyListeners();
        return clientes;
      } else {
        throw Exception('Failed to load clientes');
      }
    } catch (error) {
      print('Error fetching clientes: $error');
      throw error;
    }
  }

  Future<void> createCliente(Cliente cliente) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/clientes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cliente.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create cliente');
      }
    } catch (error) {
      print('Error creating cliente: $error');
      throw error;
    }
  }

  Future<void> updateCliente(Cliente cliente) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/clientes/${cliente.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cliente.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update cliente');
      }
    } catch (error) {
      print('Error updating cliente: $error');
      throw error;
    }
  }

  Future<void> deleteCliente(int clienteId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/clientes/$clienteId'));

      if (response.statusCode != 204) {
        throw Exception('Failed to delete cliente');
      }
    } catch (error) {
      print('Error deleting cliente: $error');
      throw error;
    }
  }
}