import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/presentation/cubit/post_cubit.dart';

class EditUserDialog extends StatefulWidget {
  final Post post;
  const EditUserDialog({super.key, required this.post});

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.post.name;
    _lastnameController.text = widget.post.lastname;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit user'),
      content: Column(
        mainAxisSize: .min,
        spacing: 10.0,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          TextField(
            controller: _lastnameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Lastname',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('Cancel'),
        ),
        BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is PostOperationSuccess) {
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                final Post newPost = Post(
                  id: widget.post.id,
                  name: _nameController.text.trim(),
                  lastname: _lastnameController.text.trim(),
                  city: widget.post.city,
                  image: widget.post.city,
                );
                context.read<PostCubit>().editPost(newPost);
              },
              child: Text(state is PostsLoading ? 'Updating' : 'Confirm'),
            );
          },
        ),
      ],
    );
  }
}
