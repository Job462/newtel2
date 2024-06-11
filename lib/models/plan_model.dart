class Plan {
  int? id;
  String nombre;
  String descripcion;
  double precio;
  DateTime createdAt;

  Plan({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.createdAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
