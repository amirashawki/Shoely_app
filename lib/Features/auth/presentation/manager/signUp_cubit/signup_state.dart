part of 'signup_cubit.dart';

abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}
