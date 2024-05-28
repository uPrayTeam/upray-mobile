import 'package:upray_mobile/features/rosary/data/datasources/rosary_datasource.dart';
import 'package:upray_mobile/features/rosary/data/datasources/rosary_local_datasource.dart';
import 'package:upray_mobile/features/rosary/domain/repositories/rosary_repository.dart';

class RosaryRepositoryImpl extends RosaryRepository {
  RosaryRepositoryImpl({
    required this.rosaryDatasource,
    required this.rosaryLocalDatasource,
  });

  final RosaryDatasource rosaryDatasource;
  final RosaryLocalDatasource rosaryLocalDatasource;
}
