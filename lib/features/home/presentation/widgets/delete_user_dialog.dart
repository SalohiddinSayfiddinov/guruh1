import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/presentation/cubit/post_cubit.dart';

class DeleteUserDialog extends StatelessWidget {
  final Post post;
  const DeleteUserDialog({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete user"),
      content: Text('Siz ${post.name}ni o\'chirmoqchimisiz?'),
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
                context.read<PostCubit>().deletePost(post.id);
              },
              child: Text(state is PostsLoading ? 'Deleting' : 'Confirm'),
            );
          },
        ),
      ],
    );
  }
}
