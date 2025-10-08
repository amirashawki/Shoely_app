import 'package:dartz/dartz.dart';
import 'package:flutter/semantics.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:shoely_app/core/errors/failures.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password) {
   
    throw UnimplementedError();
  }

}