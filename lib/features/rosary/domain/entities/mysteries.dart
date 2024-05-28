import 'package:equatable/equatable.dart';
import 'package:upray_mobile/features/rosary/domain/entities/mystery.dart';

enum MysteryType {
  joyful,
  sorrowful,
  glorious,
  luminous;
}

abstract class Mysteries extends Equatable {
  String get name;

  List<Mystery> get mysteries;

  List<int> get eligibleDays;

  MysteryType get type;
}
