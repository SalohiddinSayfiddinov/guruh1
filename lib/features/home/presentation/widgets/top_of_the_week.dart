import 'package:flutter/material.dart';
import 'package:guruh1/core/constants/app_colors.dart';
import 'package:guruh1/features/home/presentation/widgets/book_info_bottom_sheet.dart';

class TopOfTheWeek extends StatelessWidget {
  const TopOfTheWeek({super.key, required this.items});

  final List<Map<String, String>> items;

  void _showBookInfo(BuildContext context, Map<String, String> book) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      context: context,
      scrollControlDisabledMaxHeightRatio: .9,
      builder: (context) {
        return BookInfoBottomSheet(book: book);
      },
    );
  }

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
                'Top of Week',
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
          height: 198.0,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: .horizontal,
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.0),
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  _showBookInfo(context, item);
                },
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Image(
                      image: AssetImage(item['image']!),
                      height: 150.0,
                      width: 127.0,
                    ),
                    SizedBox(height: 9.0),
                    Text(
                      item['name']!,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      item['price']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
