import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/auth/presentation/manager/signUp_cubit/signup_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/agree_terms%20&conditions.dart'
    show AgreeTermsAndConditions;
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_router.dart';
import 'package:shoely_app/core/widgets/custom_button.dart';
import 'package:shoely_app/core/widgets/custom_password_textfield%20.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = SignupCubit.get(context);
    return Form(
      key: signUpCubit.formKey,
      autovalidateMode: signUpCubit.autovalidateMode,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Center(
                  child: Text(
                    'Create Account',
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
                    'Let’s Create Account Together',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff707B81),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                  hintText: 'Enter your Name',

                  keyboardType: TextInputType.name,
                  controller: signUpCubit.nameController,
                ),
                SizedBox(height: 15),

                CustomTextFormField(
                  hintText: 'Enter your email',

                  controller: signUpCubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                CustomPasswordTextField(
                  passwordController: signUpCubit.passwordController,
                ),
                SizedBox(height: 15),
                AgreeTermsAndConditions(
                  onChanged: (value) {
                    signUpCubit.isAgreeTerms = value;
                  },
                ),
                SizedBox(height: 15),
                CustomButton(
                  title: 'Sign Up',
                  verticalPadding: 14,
                  onTap: () {
                    signUpCubit.vaildateUser(context);
                  },
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                CustomRow(
                  text1: 'Already have an account?',
                  text2: 'Sign in',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
