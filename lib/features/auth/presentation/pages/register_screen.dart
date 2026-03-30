import 'package:flutter/material.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/presentation/pages/login_screen.dart';
import 'package:guruh1/features/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20.0,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: .circular(20.0)),
                hintText: 'Username',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: .circular(20.0)),
                hintText: 'Password',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<AuthProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            onPressed: () async {
              final request = RegisterRequest(
                username: usernameController.text.trim(),
                password: passwordController.text.trim(),
              );
              await context.read<AuthProvider>().register(request);
              if (provider.registerError != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(provider.registerError!)),
                );
              } else if (provider.registerResult == true) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Account created")));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => AuthProvider(),
                      child: LoginScreen(),
                    ),
                  ),
                );
              }
            },
            child: provider.registering
                ? CircularProgressIndicator.adaptive()
                : Icon(Icons.login),
          );
        },
      ),
    );
  }
}
