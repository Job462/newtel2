import 'dart:convert';

class PlanCliente {
  final int planId;
  final int clienteId;
  final DateTime createdAt;

  PlanCliente({
    required this.planId,
    required this.clienteId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'plan_id': planId,
      'cliente_id': clienteId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory PlanCliente.fromJson(Map<String, dynamic> json) {
    return PlanCliente(
      planId: json['plan_id'],
      clienteId: json['cliente_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}