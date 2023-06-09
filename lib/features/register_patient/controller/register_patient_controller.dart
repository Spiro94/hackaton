import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton/models/patient.dart';

class PatientsNotifier extends AsyncNotifier<List<Patient>> {
  PatientsNotifier() : super();

  final patientList = <Patient>[];
  @override
  List<Patient> build() {
    return patientList;
  }

  Future<void> add(Patient patient) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    patientList.add(patient);
    state = AsyncValue.data(patientList);
  }
}

final patientsProvider =
    AsyncNotifierProvider<PatientsNotifier, List<Patient>>(() {
  return PatientsNotifier();
});
