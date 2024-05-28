import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';

abstract class RegisterUserParams extends Equatable {
  String get email;

  String get password;

  String? get firstName;

  String? get lastName;

  DateTime? get dateOfBirth;

  MediaFile? get userAvatarFile;

  Json toMap();
}
