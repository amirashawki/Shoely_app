import 'package:dartz/dartz.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name);
}
