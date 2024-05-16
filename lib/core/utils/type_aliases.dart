import 'package:dartz/dartz.dart';
import 'package:upray_mobile/core/errors/failure.dart';

typedef Json = Map<String, dynamic>;
typedef FutureFailable<T> = Future<Either<Failure, T>>;
