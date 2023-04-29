import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_order.freezed.dart';
part 'medication_order.g.dart';

@freezed
class MedicationOrder with _$MedicationOrder {
  factory MedicationOrder({
    required String medication,
    required int dose,
    required String dosageUnit,
    required String frequency,
  }) = _MedicationOrder;

  factory MedicationOrder.fromJson(Map<String, dynamic> json) =>
      _$MedicationOrderFromJson(json);
}
