import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientForm extends ConsumerStatefulWidget {
  const PatientForm({super.key});

  static String get routeName => 'patient';
  static String get routeLocation => '$routeName';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorFormState();
}

class _DoctorFormState extends ConsumerState<PatientForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paciente'),
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
                      decoration: const InputDecoration(
                          labelText: 'Documento de identidad'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese su documento';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!.trim();
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!.trim();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState!.save();
                            // TODO: hacer algo con _email y _password
                          }
                        },
                        child: const Text('Iniciar sesión'),
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
