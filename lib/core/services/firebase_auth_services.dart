import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoely_app/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()} and ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions('The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions('Check your internet connection and try again.');
      } else {
        throw CustomExceptions(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions('An unexpected error occurred. Please try again.');
    }
  }
}
