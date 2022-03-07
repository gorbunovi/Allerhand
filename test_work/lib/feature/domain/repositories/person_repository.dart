import 'package:dartz/dartz.dart';
import 'package:test_work/core/error/faiture.dart';
import 'package:test_work/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
}