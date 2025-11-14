part of 'sign_in_cubit.dart';

@immutable
sealed  class SignInState {}
 class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

  class SignInSuccess extends SignInState {
  final UserEntity userEntity;
 SignInSuccess({required this.userEntity});
}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure({required this.error});
}

