import 'dart:convert';

class Cliente {
  final int id;
  final String ci;
  final String nombre;
  final String celular;
  final String contacto;
  final String direccion;
  final int idZona;
  final String ip;
  final int idPlan;
  final String activacion;
  final String estado;
  final String comentario;
  final DateTime createdAt;

  Cliente({
    required this.id,
    required this.ci,
    required this.nombre,
    required this.celular,
    required this.contacto,
    required this.direccion,
    required this.idZona,
    required this.ip,
    required this.idPlan,
    required this.activacion,
    required this.estado,
    required this.comentario,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ci': ci,
      'nombre': nombre,
      'celular': celular,
      'contacto': contacto,
      'direccion': direccion,
      'id_zona': idZona,
      'ip': ip,
      'id_plan': idPlan,
      'activacion': activacion,
      'estado': estado,
      'comentario': comentario,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      ci: json['ci'],
      nombre: json['nombre'],
      celular: json['celular'],
      contacto: json['contacto'],
      direccion: json['direccion'],
      idZona: json['id_zona'],
      ip: json['ip'],
      idPlan: json['id_plan'],
      activacion: json['activacion'],
      estado: json['estado'],
      comentario: json['comentario'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}