import 'package:dartz/dartz.dart';
import 'package:test_work/core/error/exeption.dart';
import 'package:test_work/core/error/faiture.dart';
import 'package:test_work/core/platform/networl_info.dart';
import 'package:test_work/feature/data/datasources/person_local_data_source.dart';
import 'package:test_work/feature/data/datasources/person_remote_data_source.dart';
import 'package:test_work/feature/data/models/person_model.dart';
import 'package:test_work/feature/domain/entities/person_entity.dart';
import 'package:test_work/feature/domain/repositories/person_repository.dart';



class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSource.getAllPersons(page);
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPersonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
