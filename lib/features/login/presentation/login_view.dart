import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton/features/login/controller/login_view_controller.dart';
import 'package:hackaton/features/login/presentation/doctor_form.dart';
import 'package:hackaton/features/login/presentation/patient_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ref.watch(formTypeProvider) == formType.doctor
                ? const DoctorForm()
                : const PatientForm(),
          ),
        ),
      ),
    );
  }
}
