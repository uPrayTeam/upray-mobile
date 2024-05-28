import 'package:upray_mobile/features/prayer/data/datasources/prayer_datasource.dart';
import 'package:upray_mobile/features/prayer/data/datasources/prayer_local_datasource.dart';
import 'package:upray_mobile/features/prayer/domain/repositories/prayer_repository.dart';

class PrayerRepositoryImpl extends PrayerRepository {
  PrayerRepositoryImpl({
    required this.prayerDatasource,
    required this.prayerLocalDatasource,
  });

  final PrayerDatasource prayerDatasource;
  final PrayerLocalDatasource prayerLocalDatasource;
}
