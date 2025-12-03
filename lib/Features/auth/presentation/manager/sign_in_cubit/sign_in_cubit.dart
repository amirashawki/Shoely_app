import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepoImpl) : super(SignInInitial());
  final AuthRepoImpl authRepoImpl;

  static SignInCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoading());
    var result = await authRepoImpl.signInWithEmailAndPassword(
      emailController.text.trim(),
      passWordController.text.trim(),
    );
    result.fold(
      (failure) {
        emit(SignInFailure(error: failure.errMessge));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future vaildateUser(context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      signInWithEmailAndPassword();
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  Future signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepoImpl.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailure(error: failure.errMessge));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepoImpl.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SignInFailure(error: failure.errMessge));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future signInWithGithub() async {
    emit(SignInLoading());
    var result = await authRepoImpl.signInWithGithub();
    result.fold(
      (failure) {
        emit(SignInFailure(error: failure.errMessge));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }
}
