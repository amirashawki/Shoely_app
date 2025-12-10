import 'package:flutter/material.dart';

class CustomButtonOfShoes extends StatelessWidget {
  const CustomButtonOfShoes({
    super.key,
    required this.isSelected,
    this.onTap,
    this.text = 'All Shoes',
  });
  final bool isSelected;
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected
                ? [Color(0xFFFF8A00), Color(0xFFFFC300), Color(0xFFFF8A00)]
                : [Color(0xff3E4551), Color(0xFF5A616E), Color(0xFF6B7280)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
