import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoely_app/core/errors/exceptions.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  Future<User> signInWithGitHub() async {
    final clientId = "Ov23liTys2ojLVBONK4r";
    final clientSecret = "3312b9ad5594d22aefb554d1788e550bdaead975";

    try {
      if (kIsWeb) {
        // ----------------- Web -----------------
        final githubProvider = GithubAuthProvider();
        final userCredential = await FirebaseAuth.instance.signInWithPopup(
          githubProvider,
        );
        return userCredential.user!;
      } else {
        // ---------------- Flutter App (Android/iOS) ----------------

        final redirectScheme = "myapp";
        final result = await FlutterWebAuth2.authenticate(
          url:
              "https://github.com/login/oauth/authorize?client_id=$clientId&scope=read:user&redirect_uri=$redirectScheme://callback",
          callbackUrlScheme: redirectScheme,
        );

        final code = Uri.parse(result).queryParameters['code'];
        if (code == null) {
          throw Exception("No code returned from GitHub OAuth");
        }

        final response = await http.post(
          Uri.parse("https://github.com/login/oauth/access_token"),
          headers: {"Accept": "application/json"},
          body: {
            "client_id": clientId,
            "client_secret": clientSecret,
            "code": code,
          },
        );

        final Map<String, dynamic> body = jsonDecode(response.body);
        final accessToken = body["access_token"];
        if (accessToken == null) {
          throw Exception("No access token returned from GitHub");
        }

        final githubAuthCredential = GithubAuthProvider.credential(accessToken);

        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          githubAuthCredential,
        );

        return userCredential.user!;
      }
    } catch (e, stackTrace) {
      print("Error signing in with GitHub: $e");
      print(stackTrace);
      throw Exception('Failed to sign in with GitHub.');
    }
  }
}
