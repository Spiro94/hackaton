import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/login/presentation/doctor_form.dart';
import 'package:hackaton/features/login/presentation/patient_form.dart';

class LoginDecisionView extends StatelessWidget {
  const LoginDecisionView({Key? key}) : super(key: key);

  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿Qué tipo de usuario eres?'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(DoctorForm.routeName);
                },
                child: Text('Doctor'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(PatientForm.routeName);
                },
                child: Text('Paciente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
