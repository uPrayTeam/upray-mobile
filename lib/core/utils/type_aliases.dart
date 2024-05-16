import 'package:dartz/dartz.dart';
import 'package:flutter_recruitment_task/core/errors/failure.dart';

typedef Json = Map<String, dynamic>;
typedef FutureFailable<T> = Future<Either<Failure, T>>;
