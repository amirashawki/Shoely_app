import 'package:flutter/material.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/custom_button_shoes.dart';

class TypeOfShoes extends StatelessWidget {
  const TypeOfShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 95,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15, top: 25, bottom: 20),
              child: CustomButtonOfShoes(isSelected: true),
            );
          },
        ),
      ),
    );
  }
}
