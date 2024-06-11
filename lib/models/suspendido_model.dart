import 'dart:convert';

class Suspendido {
  final int id;
  final int clienteId;
  final String codigo;
  final String usuario;
  final String celular;
  final String fecha;
  final double monto;
  final DateTime createdAt;

  Suspendido({
    required this.id,
    required this.clienteId,
    required this.codigo,
    required this.usuario,
    required this.celular,
    required this.fecha,
    required this.monto,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cliente_id': clienteId,
      'codigo': codigo,
      'usuario': usuario,
      'celular': celular,
      'fecha': fecha,
      'monto': monto,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Suspendido.fromJson(Map<String, dynamic> json) {
    return Suspendido(
      id: json['id'],
      clienteId: json['cliente_id'],
      codigo: json['codigo'],
      usuario: json['usuario'],
      celular: json['celular'],
      fecha: json['fecha'],
      monto: json['monto'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}