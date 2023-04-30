import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/controller/create_treatment_controller.dart';
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
        title: const Text('Detalles del paciente'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(
            CreateTreatmentView.routeName,
            extra: patient,
          );
        },
        label: const Text('Agregar Tratamiento'),
        icon: const Icon(Icons.add),
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
            Consumer(
              builder: (context, ref, child) {
                final treatments = ref.watch(treatmentsProvider);
                return treatments.maybeWhen(
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  error: (error, stackTrace) {
                    return Text('Error: $error');
                  },
                  data: (treamentsAll) {
                    final treatments = treamentsAll
                        .where((element) => element.patientId == patient.id)
                        .toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: treatments.length,
                      itemBuilder: (context, index) {
                        final treatment = treatments[index];
                        return ListTile(
                          title: Text(treatment.name ?? 'Tratamiento $index'),
                          subtitle: Text(
                              'Medicamentos: ${treatment.medicationOrders.length}'),
                        );
                      },
                    );
                  },
                  orElse: () {
                    return const Text('No hay tratamientos');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
