import 'package:flutter/material.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/animated_banner.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/custom_row.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/shoes_list_view.dart'
    show ShoesListView;
import 'package:shoely_app/Features/home/presentation/views/widgets/type_of_shoes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverToBoxAdapter(child: SizedBox(height: 50)),
        const CustomHomeAppBar(),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: AnimatedShoeBanner()),
        SliverToBoxAdapter(child: TypeOfShoes()),
        CustomSeeMore(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        ShoesListView(),
      ],
    );
  }
}
