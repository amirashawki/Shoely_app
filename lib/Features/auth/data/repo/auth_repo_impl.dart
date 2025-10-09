import 'package:dartz/dartz.dart';
import 'package:shoely_app/Features/auth/data/models/user_model.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:shoely_app/core/errors/exceptions.dart';
import 'package:shoely_app/core/errors/failures.dart';
import 'package:shoely_app/core/services/firebase_auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServices firebaseAuthServices;
  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async{
    try {
      var user =await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebase(user));
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    }catch (e) {
      return left(ServerFailure('An unexpected error occurred. Please try again.'));
    }
  }
}
