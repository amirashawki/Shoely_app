import 'package:flutter/material.dart';
import 'package:shoely_app/Features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class AgreeTermsAndConditions extends StatefulWidget {
  const  AgreeTermsAndConditions({super.key, required this.onChanged});
  final  ValueChanged<bool> onChanged;
  @override
  State<AgreeTermsAndConditions> createState() =>
      _AgreeTermsAndConditionsState();
}

class _AgreeTermsAndConditionsState extends State<AgreeTermsAndConditions> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isAgree,
          onChanged: (value) {
            setState(() {
              isAgree = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'I agree to the ',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff707B81),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions and Privacy Policy ',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.kprimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
