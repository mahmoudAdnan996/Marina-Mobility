import 'package:dartz/dartz.dart';
import 'package:marina_mobility/data/models/responses/failure.dart';

abstract class BaseUseCase<In, Out>{
  Future<Either<Failure, Out>> execute(In input);
}