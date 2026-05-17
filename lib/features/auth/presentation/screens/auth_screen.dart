import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:guruh1/features/auth/presentation/cubit/auth_state.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: Center(
        child: Image(
          image: NetworkImage(
            'https://drive.google.com/uc?export=view&id=19wbDS5sonCLRQ22C8rG6C5JGo3VITX9A',
          ),
        ),
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
            context.read<AuthCubit>().login(
              const AuthDto(email: 'user@example.com', password: 'string'),
            );
            // final storage = const FlutterSecureStorage();
            // print(await storage.read(key: 'token'));
          },
        ),
      ),
    );
  }
}



