import 'package:flutter_riverpod/flutter_riverpod.dart';

enum formType { doctor, patient }

final formTypeProvider = StateProvider<formType>((ref) {
  return formType.doctor;
});
