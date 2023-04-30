import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/login/presentation/decision_view.dart';
import 'package:hackaton/features/patient_detail/presentation/patient_detail_view.dart';
import 'package:hackaton/features/register_patient/controller/register_patient_controller.dart';
import 'package:hackaton/features/register_patient/presentation/register_patient_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => 'home';
  static String get routeLocation => '/$routeName';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/doctor.jpg'),
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
      floatingActionButton: Consumer(builder: (context, ref, child) {
        final patients = ref.watch(patientsProvider);
        return patients.maybeWhen(
          data: (patients) {
            if (patients.isEmpty) return Container();
            return FloatingActionButton.extended(
              onPressed: () {
                context.pushNamed(RegisterPatientView.routeName);
              },
              icon: const Icon(Icons.add),
              label: const Text('Registrar paciente'),
            );
          },
          orElse: () => Container(),
        );
      }),
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
                  'Bienvenido, doctor',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Lista de pacientes',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final patients = ref.watch(patientsProvider);

              return patients.maybeWhen(
                orElse: () => Container(),
                data: (patients) {
                  if (patients.isEmpty) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Aun no hay pacientes registrados.'),
                          const Image(
                            image: AssetImage(
                                'assets/images/magnifying_glass.jpg'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.pushNamed(RegisterPatientView.routeName);
                            },
                            child: const Text('Registrar paciente'),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      final patient = patients[index];
                      String initials =
                          patient.name.isNotEmpty && patient.lastName.isNotEmpty
                              ? '${patient.name[0]}${patient.lastName[0]}'
                              : '?';
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              initials.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 25 * 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text('${patient.name} ${patient.lastName}'),
                          onTap: () {
                            context.pushNamed(PatientDetailsView.routeName,
                                extra: patient);
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
