import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/agree_terms%20&conditions.dart' show AgreeTermsAndConditions;
import 'package:shoely_app/Features/auth/presentation/views/widgets/sign_with_%20social.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_images.dart';
import 'package:shoely_app/core/utils/app_router.dart';
import 'package:shoely_app/core/widgets/custom_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

bool isShow = false;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              SizedBox(height: 15),

              CustomTextFormField(
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),

              CustomTextFormField(
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff707B81),
                ),
              ),
              SizedBox(height: 15),
              AgreeTermsAndConditions(),
              SizedBox(height: 15),
              CustomButton(title: 'Sign Up', verticalPadding: 14),
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
    );
  }
}

