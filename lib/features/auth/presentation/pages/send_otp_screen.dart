import 'package:flutter/material.dart';
import 'package:guruh1/features/auth/models/auth_dto.dart';
import 'package:guruh1/features/auth/presentation/pages/login_screen.dart';
import 'package:guruh1/features/auth/presentation/provider/auth_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class SendOtpScreen extends StatefulWidget {
  final String email;
  const SendOtpScreen({super.key, required this.email});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .all(20.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 80),
            Text('Verification', style: TextStyle(fontSize: 40.0)),
            SizedBox(height: 10),
            Text('Enter the code sent to:\n${widget.email}'),
            SizedBox(height: 30),
            Pinput(controller: codeController, length: 6),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 44.0,
              child: Consumer<AuthProvider>(
                builder: (context, provider, _) {
                  return ElevatedButton(
                    onPressed: provider.isSendingOtp
                        ? null
                        : () async {
                            final request = OtpRequest(
                              email: widget.email,
                              code: codeController.text.trim(),
                            );
                            await context.read<AuthProvider>().sendOtp(request);
                            if (provider.otpError != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(provider.otpError.toString()),
                                ),
                              );
                            } else if (provider.otpResult == true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChangeNotifierProvider(
                                      create: (context) => AuthProvider(),
                                      child: LoginScreen(),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: provider.isSendingOtp
                        ? Text('Loading...')
                        : Text('Send Otp'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
