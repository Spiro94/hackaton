import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/controller/create_treatment_controller.dart';
import 'package:hackaton/features/home/presentation/home_view.dart';
import 'package:hackaton/models/medical_device_order.dart';
import 'package:hackaton/models/medication_order.dart';
import 'package:hackaton/models/patient.dart';
import 'package:hackaton/models/treatment.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:uuid/uuid.dart';

class CreateTreatmentView extends ConsumerStatefulWidget {
  const CreateTreatmentView({Key? key, required this.patient})
      : super(key: key);

  final Patient patient;
  static String get routeName => 'create_treatment';
  static String get routeLocation => routeName;

  @override
  ConsumerState<CreateTreatmentView> createState() =>
      _CreateTreatmentViewState();
}

class _CreateTreatmentViewState extends ConsumerState<CreateTreatmentView> {
  final List<MedicationOrder> _medicationOrders = [];
  final List<MedicalDeviceOrder> _medicalDeviceOrders = [];

  final TextEditingController _nameController = TextEditingController();

  final List<String> _frequencies = [
    'Cada 2 horas',
    'Cada 4 horas',
    'Cada 6 horas',
    'Cada 8 horas',
    'Cada 10 horas',
    'Cada 12 horas',
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen(treatmentsProvider, (previous, next) {
      next.when(
        loading: () {
          context.loaderOverlay.show();
        },
        error: (error, stackTrace) {
          context.loaderOverlay.hide();
          return;
        },
        data: (completed) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(const SnackBar(
              content: Text('Tratamiento registrado correctamente'),
              duration: Duration(seconds: 2),
            ));
          context.goNamed(HomePage.routeName);
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear tratamiento'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed:
                _medicationOrders.isNotEmpty && _nameController.text.isNotEmpty
                    ? () {
                        ref.read(treatmentsProvider.notifier).add(
                              Treatment(
                                id: const Uuid().v4(),
                                name: _nameController.text,
                                patientId: widget.patient.id,
                                medicationOrders: _medicationOrders,
                                medicalDeviceOrders: _medicalDeviceOrders,
                              ),
                            );
                      }
                    : null,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre del tratamiento',
            ),
            onChanged: (value) {
              setState(() {});
            },
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Medicamentos',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (_medicationOrders.isEmpty)
            const Text('Ningún medicamento seleccionado')
          else
            ListView.builder(
              shrinkWrap: true,
              itemCount: _medicationOrders.length,
              itemBuilder: (BuildContext context, int index) {
                MedicationOrder medicationOrder = _medicationOrders[index];
                return ListTile(
                  title: Text(medicationOrder.medication),
                  subtitle: Text(
                    'Dósis: ${medicationOrder.dose} ${medicationOrder.dosageUnit}, Frecuencia de uso: ${medicationOrder.frequency}',
                  ),
                );
              },
            ),
          const SizedBox(height: 40),
          Text(
            'Dispositivos médicos',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (_medicalDeviceOrders.isEmpty)
            const Text('Ningún dispositivo médico seleccionado')
          else
            ListView.builder(
              shrinkWrap: true,
              itemCount: _medicalDeviceOrders.length,
              itemBuilder: (BuildContext context, int index) {
                MedicalDeviceOrder medicalDeviceOrder =
                    _medicalDeviceOrders[index];
                return ListTile(
                  title: Text(medicalDeviceOrder.deviceName),
                  subtitle: Text(
                    'Frecuencia de uso: ${medicalDeviceOrder.frequency}',
                  ),
                );
              },
            ),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        child: const Icon(Icons.add),
        children: [
          FloatingActionButton.extended(
            heroTag: null,
            icon: const Icon(Icons.medication),
            label: const Text('Añadir medicamento'),
            onPressed: () {
              _showNewMedicationOrderDialog();
            },
          ),
          FloatingActionButton.extended(
            heroTag: null,
            icon: const Icon(Icons.devices_other_sharp),
            label: const Text('Añadir dispositivo médico'),
            onPressed: () {
              _showNewMedicalDeviceOrderDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showNewMedicationOrderDialog() {
    MedicationOrder newOrder = MedicationOrder(
        medication: '', dose: 0, frequency: '', dosageUnit: 'mg');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nueva orden de medicamento'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: (String value) {
                    newOrder = newOrder.copyWith(medication: value);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Dósis',
                        ),
                        onChanged: (String value) {
                          newOrder =
                              newOrder.copyWith(dose: int.tryParse(value) ?? 0);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: DropdownButtonFormField<String>(
                        value: newOrder.dosageUnit,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'mg',
                            child: Text('mg'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'ml',
                            child: Text('ml'),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            newOrder = newOrder.copyWith(dosageUnit: value!);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Frequency',
                  ),
                  onChanged: (String value) {
                    newOrder = newOrder.copyWith(frequency: value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _medicationOrders.add(newOrder);
                });
                context.pop();
              },
              child: const Text('Añadir'),
            ),
          ],
        );
      },
    );
  }

  void _showNewMedicalDeviceOrderDialog() {
    MedicalDeviceOrder newOrder =
        MedicalDeviceOrder(deviceName: '', frequency: '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nueva orden de dispositivo médico'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                  onChanged: (String value) {
                    newOrder = newOrder.copyWith(deviceName: value);
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Frencuencia de uso',
                  ),
                  onChanged: (String value) {
                    newOrder = newOrder.copyWith(frequency: value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _medicalDeviceOrders.add(newOrder);
                });
                context.pop();
              },
              child: const Text('Añadir'),
            ),
          ],
        );
      },
    );
  }
}
