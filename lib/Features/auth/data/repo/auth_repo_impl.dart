import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoely_app/Features/auth/data/models/user_model.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/Features/auth/domain/repos/auth_repo.dart';
import 'package:shoely_app/core/errors/exceptions.dart';
import 'package:shoely_app/core/errors/failures.dart';
import 'package:shoely_app/core/services/database_services.dart';
import 'package:shoely_app/core/services/firebase_auth_services.dart';
import 'package:shoely_app/core/services/shared_preferences_singleton.dart';
import 'package:shoely_app/core/utils/backend_endpoint.dart';
import 'package:shoely_app/core/utils/constants.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthServices firebaseAuthServices;
  DatabaseServices databaseServices;
  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseServices,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(id: user.uid, name: name, email: email);
      await addUserDataToDb(user: userEntity);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await firebaseAuthServices.deletUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deletUser();
      }
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserDataFromDb(userId: user.uid);
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;

    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var userExists = await databaseServices.checkDataExists(
        path: BackendEndpoint.userExists,
        documentId: user.uid,
      );
      if (userExists) {
        await getUserDataFromDb(userId: user.uid);
      } else {
        await addUserDataToDb(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deletUser();
      }
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(
        ServerFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;

    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);

      var userExists = await databaseServices.checkDataExists(
        path: BackendEndpoint.userExists,
        documentId: user.uid,
      );
      if (userExists) {
        await getUserDataFromDb(userId: user.uid);
      } else {
        await addUserDataToDb(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deletUser();
      }
      log('Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(
        ServerFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGithub() async {
    User? user;

    try {
      user = await firebaseAuthServices.signInWithGitHub();
      var userEntity = UserModel.fromFirebase(user);

      var userExists = await databaseServices.checkDataExists(
        path: BackendEndpoint.userExists,
        documentId: user.uid,
      );
      if (userExists) {
        await getUserDataFromDb(userId: user.uid);
      } else {
        await addUserDataToDb(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deletUser();
      }
      log('Exception in AuthRepoImpl.signInWithGithub: ${e.toString()}');
      return left(
        ServerFailure('An unexpected error occurred. Please try again.'),
      );
    }
  }

  @override
  Future<dynamic> addUserDataToDb({required UserEntity user}) async {
    await databaseServices.addData(
      path: BackendEndpoint.addUserPath,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.id,
    );
  }

  @override
  Future<UserEntity> getUserDataFromDb({required String userId}) async {
    var userData = await databaseServices.getData(
      path: BackendEndpoint.getUserPath,

      documentId: userId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var userData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(kUserDataKey, userData);
  }
}
