import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        throw CustomExceptions(
          'Check your internet connection and33 try again.',
        );
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

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()} and ${e.code}',
      );

      if (e.code == 'user-not-found') {
        throw CustomExceptions('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions('Wrong password provided for that user.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          'Check your internet connection and33 try again.',
        );
      } else {
        throw CustomExceptions(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthServices.SignInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomExceptions('An unexpected error occurred. Please try again.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
