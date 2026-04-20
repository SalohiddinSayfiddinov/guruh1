import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/presentation/cubit/cubit/post_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostsLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state is PostError) {
          return Center(child: Text(state.message));
        } else if (state is PostsLoaded) {
          return ListView.separated(
            itemCount: state.posts.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.0);
            },
            itemBuilder: (context, index) {
              final Post post = state.posts[index];
              return ListTile(title: Text(post.title));
            },
          );
        }

        return Center(child: Text(state.runtimeType.toString()));
      },
    );
  }
}
