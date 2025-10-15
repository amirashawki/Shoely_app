import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/presentation/manager/signUp_cubit/signup_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/signUp_view_body.dart';
import 'package:shoely_app/core/services/get_it_services.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit( getIt<AuthRepoImpl>()),
      child: SignUpViewBody(),
    );
  }
}
