// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

abstract class PrayerDatasource {}

class PrayerDatasourceImpl extends PrayerDatasource {
  PrayerDatasourceImpl({required this.dio});

  final Dio dio;
}
