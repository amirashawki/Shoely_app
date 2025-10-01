import 'package:flutter/material.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/sign_with_%20social.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_raw.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_images.dart';
import 'package:shoely_app/core/widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

bool isShow = false;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
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
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),

              SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color(0xff707B81),
                ),
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
              CustomButton(title: 'Sign In', verticalPadding: 14),
              SizedBox(height: 15),
              SizedBox(height: 15),
              CustomRow(text1: 'Don’t have an account?', text2: 'Sign Up'),
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
