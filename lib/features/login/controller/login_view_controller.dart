import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FormType { doctor, patient }

final formTypeProvider = StateProvider<FormType>((ref) {
  return FormType.doctor;
});
