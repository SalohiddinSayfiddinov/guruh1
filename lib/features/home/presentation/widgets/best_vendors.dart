import 'package:flutter/material.dart';
import 'package:guruh1/core/constants/app_colors.dart';

class BestVendors extends StatelessWidget {
  const BestVendors({super.key, required this.vendors});

  final List<String> vendors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Best vendors',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Text('See all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: .horizontal,
            itemCount: vendors.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.0),
            itemBuilder: (context, index) {
              return Image(
                image: AssetImage(vendors[index]),
                width: 80,
                height: 80,
              );
            },
          ),
        ),
      ],
    );
  }
}
