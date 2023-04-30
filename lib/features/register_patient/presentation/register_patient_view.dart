import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/presentation/create_treatment_view.dart';
import 'package:hackaton/features/register_patient/controller/register_patient_controller.dart';
import 'package:hackaton/features/register_patient/presentation/birthday_picker.dart';
import 'package:hackaton/features/register_patient/presentation/patient_avatar_picker.dart';
import 'package:hackaton/models/patient.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:uuid/uuid.dart';

class RegisterPatientView extends ConsumerStatefulWidget {
  const RegisterPatientView({Key? key}) : super(key: key);

  static String get routeName => 'register_patient';
  static String get routeLocation => routeName;

  @override
  ConsumerState<RegisterPatientView> createState() =>
      _RegisterPatientViewState();
}

class _RegisterPatientViewState extends ConsumerState<RegisterPatientView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  Patient? newPatient;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _birthdayController.dispose();
    _emailController.dispose();
    _documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(patientsProvider, (previous, next) {
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
              content: Text('Paciente registrado correctamente'),
              duration: Duration(seconds: 2),
            ));

          context.goNamed(CreateTreatmentView.routeName, extra: newPatient);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar paciente'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PatientAvatarPicker(),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los nombres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                ),
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los apellidos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              BirthdayPicker(onDateSelected: (date) {
                _birthdayController.text = date.toString();
              }),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _documentController,
                decoration: const InputDecoration(
                  labelText: 'Documento de identidad',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un documento de identidad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    newPatient = Patient(
                      id: const Uuid().v4(),
                      name: _nameController.text,
                      lastName: _lastNameController.text,
                      birthday: _birthdayController.text,
                      email: _emailController.text,
                      document: _documentController.text,
                    );

                    ref.read(patientsProvider.notifier).add(newPatient!);
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
