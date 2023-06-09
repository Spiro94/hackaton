import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/home/presentation/home_view.dart';
import 'package:transparent_image/transparent_image.dart';

class DoctorForm extends ConsumerStatefulWidget {
  const DoctorForm({super.key});

  static String get routeName => 'doctor';
  static String get routeLocation => routeName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorFormState();
}

class _DoctorFormState extends ConsumerState<DoctorForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: const AssetImage('assets/images/bg.jpg'),
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Correo electrónico'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!.trim();
                      },
                    ),
                    const SizedBox(
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
                          }
                          context.goNamed(HomePage.routeName);
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
