import 'package:flutter/material.dart';
import 'package:guruh1/core/theme/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ValueNotifier<String> gender = ValueNotifier('Men');

  @override
  void dispose() {
    gender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Katta build');
    return Scaffold(
      appBar: AppBar(title: Text(gender.value)),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ValueListenableBuilder(
            valueListenable: gender,
            builder: (context, value, child) {
              print('Build');
              return Row(
                spacing: 10.0,
                children: [
                  GenderButton(
                    onTap: () => gender.value = 'Men',
                    text: 'Men',
                    isSelected: gender.value == 'Men',
                  ),
                  GenderButton(
                    onTap: () => gender.value = 'Women',
                    text: 'Women',
                    isSelected: gender.value == 'Women',
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(gender.value);
        },
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const GenderButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: .all(16.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Color(0xFFF4F4F4),
            borderRadius: .circular(100),
          ),
          alignment: .center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: .w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
