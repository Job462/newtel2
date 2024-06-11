import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newtel_app2/models/cliente_model.dart';
import 'package:newtel_app2/models/factura_model.dart';
import 'package:newtel_app2/models/linea_model.dart';
import 'package:newtel_app2/models/zona_model.dart';
import 'package:newtel_app2/models/suspendido_model.dart';
import 'package:newtel_app2/models/plan_model.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<List<Cliente>> fetchClientes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/clientes'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Cliente> clientes = responseData.map((json) => Cliente.fromJson(json)).toList();
        return clientes;
      } else {
        throw Exception('Failed to load clientes');
      }
    } catch (error) {
      print('Error fetching clientes: $error');
      throw error;
    }
  }

  Future<Cliente> createCliente(Cliente cliente) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/clientes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cliente.toJson()),
      );

      if (response.statusCode == 201) {
        final dynamic responseData = json.decode(response.body);
        return Cliente.fromJson(responseData);
      } else {
        throw Exception('Failed to create cliente');
      }
    } catch (error) {
      print('Error creating cliente: $error');
      throw error;
    }
  }

  Future<void> updateCliente(int id, Cliente cliente) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/clientes/$id'),
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

  Future<void> deleteCliente(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/clientes/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete cliente');
      }
    } catch (error) {
      print('Error deleting cliente: $error');
      throw error;
    }
  }

  Future<List<Factura>> fetchFacturas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/facturas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Factura> facturas = responseData.map((json) => Factura.fromJson(json)).toList();
        return facturas;
      } else {
        throw Exception('Failed to load facturas');
      }
    } catch (error) {
      print('Error fetching facturas: $error');
      throw error;
    }
  }

  Future<Factura> createFactura(Factura factura) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/facturas'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(factura.toJson()),
      );

      if (response.statusCode == 201) {
        final dynamic responseData = json.decode(response.body);
        return Factura.fromJson(responseData);
      } else {
        throw Exception('Failed to create factura');
      }
    } catch (error) {
      print('Error creating factura: $error');
      throw error;
    }
  }

  Future<void> updateFactura(int id, Factura factura) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/facturas/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(factura.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update factura');
      }
    } catch (error) {
      print('Error updating factura: $error');
      throw error;
    }
  }

  Future<void> deleteFactura(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/facturas/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete factura');
      }
    } catch (error) {
      print('Error deleting factura: $error');
      throw error;
    }
  }

  Future<List<Linea>> fetchLineas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/lineas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Linea> lineas = responseData.map((json) => Linea.fromJson(json)).toList();
        return lineas;
      } else {
        throw Exception('Failed to load lineas');
      }
    } catch (error) {
      print('Error fetching lineas: $error');
      throw error;
    }
  }

  Future<List<Plan>> fetchPlanes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/planes'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Plan> planes = responseData.map((json) => Plan.fromJson(json)).toList();
        return planes;
      } else {
        throw Exception('Failed to load planes');
      }
    } catch (error) {
      print('Error fetching planes: $error');
      throw error;
    }
  }

  Future<Plan> createPlan(Plan plan) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/planes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(plan.toJson()),
      );

      if (response.statusCode == 201) {
        final dynamic responseData = json.decode(response.body);
        return Plan.fromJson(responseData);
      } else {
        throw Exception('Failed to create plan');
      }
    } catch (error) {
      print('Error creating plan: $error');
      throw error;
    }
  }

  Future<void> updatePlan(int id, Plan plan) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/planes/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(plan.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update plan');
      }
    } catch (error) {
      print('Error updating plan: $error');
      throw error;
    }
  }

  Future<void> deletePlan(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/planes/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete plan');
      }
    } catch (error) {
      print('Error deleting plan: $error');
      throw error;
    }
  }

  Future<List<Zona>> fetchZonas() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/zonas'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Zona> zonas = responseData.map((json) => Zona.fromJson(json)).toList();
        return zonas;
      } else {
        throw Exception('Failed to load zonas');
      }
    } catch (error) {
      print('Error fetching zonas: $error');
      throw error;
    }
  }

  Future<List<Suspendido>> fetchSuspendidos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/suspendidos'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Suspendido> suspendidos = responseData.map((json) => Suspendido.fromJson(json)).toList();
        return suspendidos;
      } else {
        throw Exception('Failed to load suspendidos');
      }
    } catch (error) {
      print('Error fetching suspendidos: $error');
      throw error;
    }
  }
}