// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

abstract class RosaryDatasource {}

class RosaryDatasourceImpl extends RosaryDatasource {
  RosaryDatasourceImpl({required this.dio});

  final Dio dio;
}
