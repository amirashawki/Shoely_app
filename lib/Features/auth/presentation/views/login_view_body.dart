import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/sign_with_%20social.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_router.dart';
import 'package:shoely_app/core/widgets/custom_button.dart';
import 'package:shoely_app/core/widgets/custom_password_textfield%20.dart';

import '../../../../core/utils/app_images.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = SignInCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Form(
          autovalidateMode: signInCubit.autovalidateMode,
          key: signInCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Center(
                child: Text(
                  'Hello Again!',

                  style: TextStyle(
                    fontSize: 28,
                    color: AppColor.kprimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: Text(
                  'Welcome Back You’ve Been Missed!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707B81),
                  ),
                ),
              ),
              SizedBox(height: 40),

              CustomTextFormField(
                controller: signInCubit.emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),

              SizedBox(height: 12),
              CustomPasswordTextField(
                passwordController: signInCubit.passWordController,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Recovery Password',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff707B81),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomButton(
                title: 'Sign In',
                verticalPadding: 14,
                onTap: () {
                  signInCubit.vaildateUser(context);
                },
              ),
              SizedBox(height: 15),
              SizedBox(height: 15),
              CustomRow(
                text1: 'Don’t have an account?',
                text2: 'Sign Up',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSingUpView);
                },
              ),
              SizedBox(height: 20),
              CustomDivider(),
              SizedBox(height: 20),
              SignWithSocialButton(
                title: 'Sign In With Google',
                onTap: () {
                  signInCubit.signInWithGoogle();
                },
                image: Assets.imagesGoogle,
              ),
              SizedBox(height: 15),

              SignWithSocialButton(
                title: 'Sign In With Apple',
                image: Assets.imagesApple,
              ),
              SizedBox(height: 15),
              SignWithSocialButton(
                title: 'Sign In With Facebook',
                onTap: () {
                  signInCubit.signInWithFacebook();
                },
                image: Assets.imagesFace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
