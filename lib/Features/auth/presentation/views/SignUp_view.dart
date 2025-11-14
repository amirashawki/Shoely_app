import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoely_app/Features/auth/data/repo/auth_repo_impl.dart';
import 'package:shoely_app/Features/auth/presentation/manager/signUp_cubit/signup_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/signUp_view_body.dart';
import 'package:shoely_app/core/helper/error_snack_bar.dart';
import 'package:shoely_app/core/services/get_it_services.dart';
import 'package:shoely_app/core/utils/app_router.dart' show AppRouter;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepoImpl>()),
      child: BlocConsumerSignUpViewBody(),
    );
  }
}

class BlocConsumerSignUpViewBody extends StatelessWidget {
  const BlocConsumerSignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          errorSnackBar(context, state.error);
        } else if (state is SignupSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
