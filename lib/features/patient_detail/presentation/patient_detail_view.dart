import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/controller/create_treatment_controller.dart';
import 'package:hackaton/features/create_treatment/presentation/create_treatment_view.dart';
import 'package:hackaton/models/medical_device_order.dart';
import 'package:hackaton/models/medication_order.dart';
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          const Text('Nombres',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(patient.name),
          const SizedBox(height: 16),
          const Text('Apellidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(patient.lastName),
          const SizedBox(height: 16),
          const Text('Fecha de nacimiento',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(patient.birthday.toString()),
          const SizedBox(height: 16),
          const Text('Correo electrónico',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(patient.email),
          const SizedBox(height: 16),
          const Text('Documento de identidad',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(patient.document),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Tratamientos:',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
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
                  if (treatments.isEmpty) {
                    return const Text('No hay tratamientos asignados aún.');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: treatments.length,
                    itemBuilder: (context, index) {
                      final treatment = treatments[index];
                      return ExpansionTile(
                        title: Text(
                          '${treatment.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: treatment.medicationOrders.length,
                            itemBuilder: (BuildContext context, int index) {
                              MedicationOrder medicationOrder =
                                  treatment.medicationOrders[index];
                              return ListTile(
                                title: Text(medicationOrder.medication),
                                subtitle: Text(
                                  'Dósis: ${medicationOrder.dose} ${medicationOrder.dosageUnit}, Frecuencia de uso: ${medicationOrder.frequency}',
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: treatment.medicalDeviceOrders.length,
                            itemBuilder: (BuildContext context, int index) {
                              MedicalDeviceOrder medicalDeviceOrder =
                                  treatment.medicalDeviceOrders[index];
                              return ListTile(
                                title: Text(medicalDeviceOrder.deviceName),
                                subtitle: Text(
                                  'Frecuencia de uso: ${medicalDeviceOrder.frequency}',
                                ),
                              );
                            },
                          ),
                        ],
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
    );
  }
}
