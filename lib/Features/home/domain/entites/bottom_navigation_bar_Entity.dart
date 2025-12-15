import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationBarEntity {
  final String label;
  final IconData icon;

  BottomNavigationBarEntity({required this.label, required this.icon});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(label: 'Home', icon: Iconsax.home),
  BottomNavigationBarEntity(label: 'Search', icon: Iconsax.search_normal),
  BottomNavigationBarEntity(label: 'WishList', icon: Iconsax.heart),
  BottomNavigationBarEntity(label: 'Profile', icon: Icons.person_2_outlined),
];
