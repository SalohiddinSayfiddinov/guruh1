import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh1/features/auth/presentation/cubit/auth_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final picker = ImagePicker();
  final player = AudioPlayer();

  File? selectedImage;

  Future<XFile?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  bool get isPlaying => player.state == PlayerState.playing;

  final List<String> music = const ['audios/zivert.m4a', 'audios/rihanna.m4a'];

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: selectedImage != null
                ? Image(image: FileImage(selectedImage!))
                : const Icon(Icons.broken_image),
          ),

          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble().clamp(
              0,
              duration.inSeconds.toDouble(),
            ),

            onChanged: (value) async {
              final newPosition = Duration(seconds: value.toInt());

              await player.seek(newPosition);

              setState(() {
                position = newPosition;
              });
            },
          ),
          Text(
            '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}'
            ' / '
            '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
          ),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              IconButton(
                onPressed: () async {
                  if (currentIndex != 0) {
                    currentIndex--;
                    await player.play(AssetSource(music[currentIndex]));
                    setState(() {});
                  }
                },
                icon: const Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () async {
                  if (player.state == .stopped) {
                    await player.play(AssetSource(music[currentIndex]));
                  } else if (isPlaying) {
                    await player.pause();
                  } else if (player.state == PlayerState.paused) {
                    await player.resume();
                  }
                  setState(() {});
                },
                icon: isPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () async {
                  if (currentIndex != 1) {
                    currentIndex++;
                    await player.play(AssetSource(music[currentIndex]));
                    setState(() {});
                  }
                },
                icon: const Icon(Icons.skip_next),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              // barrierDismissible: false,
              builder: (context) {
                return Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Lottie.asset(
                      'assets/animations/Loading.json',
                      height: 100,
                      width: 100,
                    ),
                  ),
                );
              },
            );
          } else if (state is AuthError) {
            Navigator.pop(context);
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.message),
            );
          } else if (state is AuthSuccess) {
            Navigator.pop(context);
            toastification.show(
              type: ToastificationType.success,
              title: Text(state.message),
            );
          }
        },
        child: FloatingActionButton(
          onPressed: () async {
            // await player.play(AssetSource(music[0]));
            // setState(() {});
            final image = await pickImage();
            if (image != null) {
              setState(() {
                selectedImage = File(image.path);
              });

              //   context.read<AuthCubit>().uploadFile(selectedImage!);
            }
            // final storage = const FlutterSecureStorage();
            // print(await storage.read(key: 'token'));
          },
        ),
      ),
    );
  }
}
