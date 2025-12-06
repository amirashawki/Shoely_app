import 'package:dartz/dartz.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithGithub();
  Future<dynamic> addUserDataToDb({required UserEntity user});
  Future getUserDataFromDb({required String userId});
}
