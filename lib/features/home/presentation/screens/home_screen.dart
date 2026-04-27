import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/presentation/cubit/post_cubit.dart';
import 'package:guruh1/features/home/presentation/widgets/delete_user_dialog.dart';
import 'package:guruh1/features/home/presentation/widgets/edit_user_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().getPosts();
  }

  void showEditDialog(BuildContext pageContext, Post post) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (pageContext) => PostCubit(),
          child: EditUserDialog(post: post),
        );
      },
    );
    if (result == true) {
      if (!mounted) return;
      context.read<PostCubit>().getPosts();
    }
  }

  void showDeleteDialog(BuildContext pageContext, Post post) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (pageContext) => PostCubit(),
          child: DeleteUserDialog(post: post),
        );
      },
    );
    if (result == true) {
      if (!mounted) return;
      context.read<PostCubit>().getPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else if (state is PostsLoaded) {
            return ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final Post post = state.posts[index];
                return ListTile(
                  title: Text(post.name),
                  trailing: Row(
                    spacing: 5,
                    mainAxisSize: .min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showEditDialog(context, post);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          showDeleteDialog(context, post);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
