import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/domain/entites/user_entity.dart';
import 'package:shoely_app/core/helper/error_snack_bar.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepoImpl) : super(SignupInitial());
  final AuthRepoImpl authRepoImpl;
  static SignupCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool isAgreeTerms = false;

  Future<void> signUp() async {
    emit(SignupLoading());
    final result = await authRepoImpl.createUserWithEmailAndPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
      nameController.text.trim(),
    );
    result.fold(
      (failure) => emit(SignupFailure(error: failure.errMessge)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }

  Future vaildateUser(context) async {
    if (formKey.currentState!.validate()) {
      if (isAgreeTerms) {
        signUp();
      } else {
        errorSnackBar(context, 'You must agree to the terms and conditions');
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
