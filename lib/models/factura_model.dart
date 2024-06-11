import 'dart:convert';

class Factura {
  final int id;
  final int clienteId;
  final int idPlan;
  final String mes;
  final String fechaPago;
  final String modalidad;
  final double monto;
  final DateTime createdAt;

  Factura({
    required this.id,
    required this.clienteId,
    required this.idPlan,
    required this.mes,
    required this.fechaPago,
    required this.modalidad,
    required this.monto,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cliente_id': clienteId,
      'id_plan': idPlan,
      'mes': mes,
      'fecha_pago': fechaPago,
      'modalidad': modalidad,
      'monto': monto,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Factura.fromJson(Map<String, dynamic> json) {
    return Factura(
      id: json['id'],
      clienteId: json['cliente_id'],
      idPlan: json['id_plan'],
      mes: json['mes'],
      fechaPago: json['fecha_pago'],
      modalidad: json['modalidad'],
      monto: json['monto'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}