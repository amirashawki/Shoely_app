import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/login_view_body.dart';
import 'package:shoely_app/core/helper/error_snack_bar.dart';
import 'package:shoely_app/core/services/get_it_services.dart';
import 'package:shoely_app/core/widgets/custom_progress_hud.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(getIt<AuthRepoImpl>()),
        child: BlocConsumerSignIn(),
      ),
    );
  }
}

class BlocConsumerSignIn extends StatelessWidget {
  const BlocConsumerSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          errorSnackBar(context, state.error);
        } else if (state is SignInSuccess) {
          errorSnackBar(context, 'login success');
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is SignInLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
