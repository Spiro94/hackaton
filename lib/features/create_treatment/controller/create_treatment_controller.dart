import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton/models/treatment.dart';

class TreatmentsNotifier extends AsyncNotifier<List<Treatment>> {
  TreatmentsNotifier() : super();

  final treatmentList = <Treatment>[];
  @override
  List<Treatment> build() {
    return treatmentList;
  }

  Future<void> add(Treatment treatment) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    treatmentList.add(treatment);
    state = AsyncValue.data(treatmentList);
  }
}

final treatmentsProvider =
    AsyncNotifierProvider<TreatmentsNotifier, List<Treatment>>(() {
  return TreatmentsNotifier();
});
