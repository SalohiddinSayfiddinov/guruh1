part of 'post_cubit.dart';

abstract class PostState {}

final class PostInitial extends PostState {}

final class PostsLoading extends PostState {}

final class PostError extends PostState {
  final String message;

  PostError({required this.message});
}

final class PostsLoaded extends PostState {
  final List<Post> posts;

  PostsLoaded({required this.posts});
}

final class PostOperationSuccess extends PostState {
  final String message;

  PostOperationSuccess({required this.message});
}
