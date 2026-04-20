import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/home/presentation/cubit/cubit/post_cubit.dart';
import 'package:guruh1/features/home/presentation/cubit/home_cubit.dart';
import 'package:guruh1/features/home/presentation/screens/home_body.dart';

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

  final List<Widget> pages = [
    HomeBody(),
    Center(child: Text('Profile', style: TextStyle(fontSize: 44.0))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<HomeCubit>().state.page],
      bottomNavigationBar: MyNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              final noteController = TextEditingController();
              final formKey = GlobalKey<FormState>();
              return BlocProvider(
                create: (context) => PostCubit(),
                child: AlertDialog(
                  title: Text("Note yozish"),
                  content: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: noteController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Your note',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the form";
                        }
                        return null;
                      },
                    ),
                  ),
                  actionsPadding: .only(right: 10.0, bottom: 5),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Text('Cancel'),
                    ),
                    BlocConsumer<PostCubit, PostState>(
                      listener: (context, state) {
                        if (state is PostError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                          Navigator.pop(dialogContext);
                        } else if (state is PostOperationSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                          Navigator.pop(dialogContext);
                        }
                      },
                      builder: (context, state) {
                        return TextButton(
                          onPressed: state is PostsLoading
                              ? null
                              : () {
                                  if (!formKey.currentState!.validate()) return;
                                  final Post post = Post(
                                    id: 1,
                                    userId: 1,
                                    title: noteController.text.trim(),
                                    body: 'New Body',
                                  );
                                  context.read<PostCubit>().createPost(post);
                                },
                          child: state is PostsLoading
                              ? CircularProgressIndicator.adaptive()
                              : Text('Add'),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        context.read<HomeCubit>().changePage(value);
      },
      currentIndex: context.watch<HomeCubit>().state.page,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
