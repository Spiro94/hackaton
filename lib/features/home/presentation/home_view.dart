import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/register_patient/presentation/register_patient_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => 'home';
  static String get routeLocation => '/$routeName';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _patients = []; // list of patients, initially empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          backgroundImage: AssetImage('assets/images/doctor.jpg'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Bienvenido, doctor',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
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
          _patients.isEmpty // if there are no patients
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Aun no hay pacientes registrados.'),
                      Image(
                        image: AssetImage('assets/images/magnifying_glass.jpg'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed(RegisterPatientView.routeName);
                        },
                        child: Text('Registrar paciente'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _patients.length,
                  itemBuilder: (context, index) {
                    final patient = _patients[index];
                    return ListTile(
                      title: Text(patient),
                      onTap: () {
                        // navigate to patient details screen
                        Navigator.pushNamed(context, '/patient_details',
                            arguments: {'patient_name': patient});
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
