import 'package:equatable/equatable.dart';
import 'package:upray_mobile/features/rosary/domain/entities/mysteries.dart';

abstract class Mystery extends Equatable {
  int get index;

  String get name;

  String? get description;

  MysteryType get type;
}
