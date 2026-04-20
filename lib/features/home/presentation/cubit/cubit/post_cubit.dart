import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/repo/post_repo.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPosts() async {
    emit(PostsLoading());
    try {
      final posts = await PostRepo().getPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

  Future<void> createPost(Post post) async {
    emit(PostsLoading());
    try {
      final newPost = await PostRepo().createPost(post);
      emit(
        PostOperationSuccess(
          message: 'Successfully created post ${newPost.title}',
        ),
      );
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
