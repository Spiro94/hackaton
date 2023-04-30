import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/home_patient/presentation/home_patient_view.dart';
import 'package:hackaton/features/register_patient/controller/register_patient_controller.dart';
import 'package:hackaton/models/patient.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PatientForm extends ConsumerStatefulWidget {
  const PatientForm({super.key});

  static String get routeName => 'patient';
  static String get routeLocation => routeName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorFormState();
}

class _DoctorFormState extends ConsumerState<PatientForm> {
  final _formKey = GlobalKey<FormState>();

  final _document = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paciente'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _document,
                      decoration: const InputDecoration(
                          labelText: 'Documento de identidad'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese su documento';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            // _formKey.currentState!.save();
                            context.loaderOverlay.show();
                            await Future.delayed(const Duration(seconds: 2));
                            if (!mounted) return;
                            final patients = ref.read(patientsProvider);
                            Patient? patient;
                            patients.whenData((value) {
                              patient = value.firstWhere((element) =>
                                  element.document == _document.text);
                            });
                            context.loaderOverlay.hide();
                            if (patient != null) {
                              context.goNamed(HomePatientView.routeName,
                                  extra: patient);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Paciente no encontrado'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Ingresar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
