import 'package:flutter/material.dart';
import 'package:newtel_app2/services/api_service.dart';
import 'package:newtel_app2/models/plan_model.dart';

class PlanesScreen extends StatefulWidget {
  @override
  _PlanesScreenState createState() => _PlanesScreenState();
}

class _PlanesScreenState extends State<PlanesScreen> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  List<Plan> _planes = [];
  Plan? _selectedPlan;
  late String _nombre;
  late String _descripcion;
  late double _precio;

  @override
  void initState() {
    super.initState();
    _fetchPlanes();
    _nombre = '';
    _descripcion = '';
    _precio = 0.0;
  }

  void _fetchPlanes() async {
    try {
      List<Plan> planes = await apiService.fetchPlanes();
      setState(() {
        _planes = planes;
      });
    } catch (error) {
      print('Error fetching planes: $error');
    }
  }

  void _addOrUpdatePlan() async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    DateTime now = DateTime.now();
    Plan newPlan = Plan(
      id: _selectedPlan?.id,
      nombre: _nombre,
      descripcion: _descripcion,
      precio: _precio,
      createdAt: _selectedPlan?.createdAt ?? now,
    );

    try {
      if (_selectedPlan == null) {
        await apiService.createPlan(newPlan);
      } else {
        await apiService.updatePlan(_selectedPlan!.id!, newPlan);
      }
      _fetchPlanes();
      _clearForm();
    } catch (error) {
      print('Error adding/updating plan: $error');
    }
  }
}



  void _deletePlan(int? id) {
    if (id != null) {
      apiService.deletePlan(id).then((_) {
        _fetchPlanes();
      }).catchError((error) {
        print('Error deleting plan: $error');
      });
    } else {
      print('Error: Plan ID is null');
    }
  }

  void _clearForm() {
    setState(() {
      _selectedPlan = null;
      _nombre = '';
      _descripcion = '';
      _precio = 0.0;
      _formKey.currentState!.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Planes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _selectedPlan?.nombre ?? '',
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nombre = value!;
                    },
                  ),
                  TextFormField(
                    initialValue: _selectedPlan?.descripcion ?? '',
                    decoration: InputDecoration(labelText: 'Descripción'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una descripción';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _descripcion = value!;
                    },
                  ),
                  TextFormField(
                    initialValue: _selectedPlan?.precio.toString() ?? '',
                    decoration: InputDecoration(labelText: 'Precio'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un precio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _precio = double.tryParse(value!) ?? 0.0;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _addOrUpdatePlan,
                    child: Text(_selectedPlan == null ? 'Añadir Plan' : 'Actualizar Plan'),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _planes.length,
                itemBuilder: (context, index) {
                  final plan = _planes[index];
                  return ListTile(
                    title: Text(plan.nombre),
                    subtitle: Text(plan.descripcion),
                    trailing: Text('\$${plan.precio.toString()}'),
                    onTap: () {
                      setState(() {
                        _selectedPlan = plan;
                        _formKey.currentState!.reset();
                      });
                    },
                    onLongPress: () {
                      // Verificación de null antes de llamar a _deletePlan
                      if (plan.id != null) {
                        _deletePlan(plan.id);
                      } else {
                        print('Error: Plan ID is null');
                      }
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
