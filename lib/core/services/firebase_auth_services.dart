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
      if (e.code == 'weak-password') {
        throw CustomExceptions('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions('The account already exists for that email.');
      }
      else {
        throw CustomExceptions(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomExceptions('An unexpected error occurred. Please try again.');
    }
  }
}
