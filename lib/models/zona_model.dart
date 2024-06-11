import 'dart:convert';

class Zona {
  final int id;
  final String nombre;
  final String comentario;
  final int idLinea;
  final DateTime createdAt;

  Zona({
    required this.id,
    required this.nombre,
    required this.comentario,
    required this.idLinea,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'comentario': comentario,
      'id_linea': idLinea,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Zona.fromJson(Map<String, dynamic> json) {
    return Zona(
      id: json['id'],
      nombre: json['nombre'],
      comentario: json['comentario'],
      idLinea: json['id_linea'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}