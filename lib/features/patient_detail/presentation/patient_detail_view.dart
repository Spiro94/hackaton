import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/presentation/create_treatment_view.dart';
import 'package:hackaton/models/patient.dart';

class PatientDetailsView extends StatelessWidget {
  final Patient patient;

  static String get routeName => 'patient_details';
  static String get routeLocation => routeName;

  const PatientDetailsView({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del paciente:'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text('Nombres: ${patient.name}'),
            Text('Apellidos: ${patient.lastName}'),
            Text('Fecha de nacimiento: ${patient.birthday}'),
            Text('Correo Electrónico: ${patient.email}'),
            Text('Documento de identidad: ${patient.document}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(CreateTreatmentView.routeName);
              },
              child: const Text('Iniciar tratamiento'),
            ),
          ],
        ),
      ),
    );
  }
}
