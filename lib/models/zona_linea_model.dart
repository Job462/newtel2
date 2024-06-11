import 'dart:convert';

class ZonaLinea {
  final int zonaId;
  final int lineaId;
  final DateTime createdAt;

  ZonaLinea({
    required this.zonaId,
    required this.lineaId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'zona_id': zonaId,
      'linea_id': lineaId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory ZonaLinea.fromJson(Map<String, dynamic> json) {
    return ZonaLinea(
      zonaId: json['zona_id'],
      lineaId: json['linea_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}