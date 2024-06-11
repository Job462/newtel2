import 'dart:convert';

class Linea {
  final int id;
  final String nombre;
  final String proveedor;
  final String velocidad;
  final double precio;
  final String tipo;
  final String titular;
  final String celular;
  final String comentario;
  final String direccion;
  final String encargado;
  final DateTime createdAt;

  Linea({
    required this.id,
    required this.nombre,
    required this.proveedor,
    required this.velocidad,
    required this.precio,
    required this.tipo,
    required this.titular,
    required this.celular,
    required this.comentario,
    required this.direccion,
    required this.encargado,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'proveedor': proveedor,
      'velocidad': velocidad,
      'precio': precio,
      'tipo': tipo,
      'titular': titular,
      'celular': celular,
      'comentario': comentario,
      'direccion': direccion,
      'encargado': encargado,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Linea.fromJson(Map<String, dynamic> json) {
    return Linea(
      id: json['id'],
      nombre: json['nombre'],
      proveedor: json['proveedor'],
      velocidad: json['velocidad'],
      precio: json['precio'].toDouble(),
      tipo: json['tipo'],
      titular: json['titular'],
      celular: json['celular'],
      comentario: json['comentario'],
      direccion: json['direccion'],
      encargado: json['encargado'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}