import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/presentation/create_treatment_view.dart';
import 'package:hackaton/features/register_patient/presentation/patient_avatar_picker.dart';

class RegisterPatientView extends StatefulWidget {
  const RegisterPatientView({Key? key}) : super(key: key);

  static String get routeName => 'register_patient';
  static String get routeLocation => '$routeName';

  @override
  _RegisterPatientViewState createState() => _RegisterPatientViewState();
}

class _RegisterPatientViewState extends State<RegisterPatientView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar paciente'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PatientAvatarPicker(),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombres',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los nombres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Apellidos',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los apellidos';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _birthdayController,
                decoration: InputDecoration(
                  labelText: 'Fecha de nacimiento',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la fecha de nacimiento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
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
              SizedBox(height: 16),
              TextFormField(
                controller: _documentController,
                decoration: InputDecoration(
                  labelText: 'Documento de identidad',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un documento de identidad';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // save patient data and navigate back to home screen
                  }
                  context.pushNamed(CreateTreatmentView.routeName);
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
