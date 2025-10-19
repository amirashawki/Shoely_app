import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/auth/presentation/manager/signUp_cubit/signup_cubit.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/agree_terms%20&conditions.dart'
    show AgreeTermsAndConditions;
import 'package:shoely_app/Features/auth/presentation/views/widgets/sign_with_%20social.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:shoely_app/core/helper/error_snack_bar.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_images.dart';
import 'package:shoely_app/core/utils/app_router.dart';
import 'package:shoely_app/core/widgets/custom_button.dart';
import 'package:shoely_app/core/widgets/custom_password_textfield%20.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
late bool isAgreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),
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
                  controller: nameController,
                ),
                SizedBox(height: 15),

                CustomTextFormField(
                  hintText: 'Enter your email',

                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),

                CustomPasswordTextField(),
                SizedBox(height: 15),
                AgreeTermsAndConditions(onChanged: (value) {
                  isAgreeTerms = value;
                  
                },),
                SizedBox(height: 15),
                CustomButton(
                  title: 'Sign Up',
                  verticalPadding: 14,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (isAgreeTerms) {
                        context.read<SignupCubit>().signUp(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      } else {
                        errorSnackBar(
                            context, 'You must agree to the terms and conditions');
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 15),
                SizedBox(height: 15),
                CustomRow(
                  text1: 'Already have an account?',
                  text2: 'Sign in',
                  onTap: () {
                    GoRouter.of(context).pop(AppRouter.kLoginView);
                  },
                ),
                SizedBox(height: 20),
                CustomDivider(),
                SizedBox(height: 20),
                SignWithSocialButton(
                  title: 'Sign In With Google',
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
                  image: Assets.imagesFace,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

