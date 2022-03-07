import 'package:dartz/dartz.dart';
import '../error/faiture.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
