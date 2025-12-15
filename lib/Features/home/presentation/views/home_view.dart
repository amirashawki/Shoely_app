import 'package:flutter/material.dart';
import 'package:shoely_app/Features/home/presentation/views/home_view_body.dart';
import 'package:shoely_app/core/widgets/bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
