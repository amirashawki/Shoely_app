import 'package:flutter/material.dart';
import 'package:shoely_app/Features/home/presentation/views/widgets/custom_shoes.dart';

class ShoesListView extends StatelessWidget {
  ShoesListView({super.key});
  final List<Map<String, dynamic>> shoes = [
    {
      'image': 'assets/images/shoe1.jpg',
      'name': 'Midnight Elite',
      'price': '\$249.99',
    },
    {
      'image': 'assets/images/shoe2.jpg',
      'name': 'Urban Legend',
      'price': '\$189.99',
    },
    {
      'image': 'assets/images/shoe1.jpg',
      'name': 'Midnight Elite',
      'price': '\$249.99',
    },
    {
      'image': 'assets/images/shoe2.jpg',
      'name': 'Urban Legend',
      'price': '\$189.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        bool isLeft = index % 2 == 0;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: isLeft
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [ShoeCard(item: shoes[index])],
          ),
        );
      },
    );
  }
}
