import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/login/presentation/doctor_form.dart';
import 'package:hackaton/features/login/presentation/patient_form.dart';
import 'package:transparent_image/transparent_image.dart';

class LoginDecisionView extends StatelessWidget {
  const LoginDecisionView({Key? key}) : super(key: key);

  static String get routeName => 'login';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Bienvenido al AVCC app',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: const AssetImage('assets/images/bg2.jpg'),
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const SizedBox(height: 16),
                Text(
                  '¿Quién eres?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(DoctorForm.routeName);
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Center(child: Text('Doctor')),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(PatientForm.routeName);
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Center(child: Text('Paciente')),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
