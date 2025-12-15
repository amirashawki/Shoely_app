import 'package:flutter/material.dart';
import 'package:shoely_app/Features/home/domain/entites/bottom_navigation_bar_Entity.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      margin: EdgeInsets.only(right: 25, left: 25, top: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: BottomNavItem(
              isSelected: selectedIndex == index,
              bottomNavigationBarEntity: entity,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSelected
            ? Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.kOrangeColor,
                ),
              )
            : SizedBox(),
        SizedBox(height: 8),
        Container(
          height: 47,
          width: 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: isSelected
                  ? [AppColor.kOrangeColor, Color(0xFFFFC300)]
                  : [Color(0xFF1C2733), Color(0xFF1C2733)],
            ),
          ),
          child: Icon(
            bottomNavigationBarEntity.icon,
            color: Colors.white,
            size: 25,
          ),
        ),
        SizedBox(height: 5),
        Text(
          bottomNavigationBarEntity.label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
