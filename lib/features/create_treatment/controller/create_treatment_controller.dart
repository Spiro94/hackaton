import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton/models/patient.dart';

class TreatmentsNotifier extends AsyncNotifier<void> {
  TreatmentsNotifier() : super();

  final patientList = <Patient>[];
  @override
  List<Patient> build() {
    return patientList;
  }

  Future<void> add(Patient patient) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    patientList.add(patient);
    state = const AsyncValue.data(null);
  }
}

final patientsProvider = AsyncNotifierProvider<TreatmentsNotifier, void>(() {
  return TreatmentsNotifier();
});
