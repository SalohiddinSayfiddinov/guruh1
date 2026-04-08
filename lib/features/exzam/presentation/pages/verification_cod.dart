import 'package:flutter/material.dart';
import 'package:guruh1/assets/images/images.dart';
import 'package:guruh1/features/auth/models/model_dio.dart';
import 'package:guruh1/features/auth/presentation/provider/this_provaider.dart';
import 'package:guruh1/features/exzam/presentation/pages/october.dart';
import 'package:guruh1/features/exzam/presentation/pages/verifiy.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationCod extends StatefulWidget {
  final String email;
  const VerificationCod({super.key,required this.email});

  @override
  State<VerificationCod> createState() => _VerificationCodState();
}

class _VerificationCodState extends State<VerificationCod> {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ThisProvaider>();
    });
  }

  final codController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: Icon(Icons.keyboard_arrow_left_sharp, size: 20),
        title: Text(
          "Verification",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Enter your\n Verification Code',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Pinput(controller: codController),
            SizedBox(height: 20),
            Text(
              '04:59',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We send verification code to your\n email brajoma farangis@gmail.com.You\n check your inbox:\n${widget.email}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'I didn’t received the code? Send again',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),Pinput(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Consumer<ThisProvaider>(
                  builder: (context, provider, _) {
                    return ElevatedButton(
                      onPressed: provider.istendOtp
                          ? null
                          : () async {
                              final request = OtpRequest(
                                email: 'farangid@gmail.com',
                                code: codController.text.trim(),
                              );
                              await context.read<ThisProvaider>().tendOtp(
                                request,
                              );
                              if (provider.otpError != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(provider.otpError!)),
                                );
                              } else if (provider.otpResult == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => October(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Verification code is incorrect!",
                                    ),
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 8, 73, 126),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                      ),
                      child: provider.istendOtp
                          ? Text(
                              'Leoding',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Text(
                              'Verifiy',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
