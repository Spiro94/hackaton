import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/controller/create_treatment_controller.dart';
import 'package:hackaton/features/login/presentation/decision_view.dart';
import 'package:hackaton/models/medical_device_order.dart';
import 'package:hackaton/models/medication_order.dart';
import 'package:hackaton/models/patient.dart';

class HomePatientView extends StatefulWidget {
  const HomePatientView({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final Patient patient;

  static String get routeName => 'home_patient';
  static String get routeLocation => '/$routeName';

  @override
  State<HomePatientView> createState() => _HomePatientViewState();
}

class _HomePatientViewState extends State<HomePatientView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user.jpg'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(LoginDecisionView.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Bienvenido, ${widget.patient.name}',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Tratamientos en curso',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
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
                      .where(
                          (element) => element.patientId == widget.patient.id)
                      .toList();
                  if (treatments.isEmpty) {
                    return const Text('No hay tratamientos asignados aún.');
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: treatments.length,
                    itemBuilder: (context, index) {
                      final treatment = treatments[index];
                      return ExpansionTile(
                        initiallyExpanded: true,
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
