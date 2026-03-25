import 'package:flutter/material.dart';

class BookInfoBottomSheet extends StatefulWidget {
  final Map<String, String> book;
  const BookInfoBottomSheet({super.key, required this.book});

  @override
  State<BookInfoBottomSheet> createState() => _BookInfoBottomSheetState();
}

class _BookInfoBottomSheetState extends State<BookInfoBottomSheet> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(top: 0),
      child: Column(
        children: [
          Image(image: AssetImage(widget.book['image']!)),
          IconButton(
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: isLiked ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
