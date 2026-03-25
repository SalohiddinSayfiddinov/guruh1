import 'package:flutter/material.dart';
import 'package:guruh1/core/constants/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> code = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Verification Email'),
          Text.rich(
            TextSpan(
              text: 'Please enter the code we just sent to email\n',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
              children: [
                TextSpan(
                  text: 'Johndoe@gmail.com',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: .center,
            spacing: 16.0,
            children: List.generate(4, (index) {
              return _buildField(index < code.length ? code[index] : '');
            }),
          ),
          Spacer(),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 80,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  _onTap(index);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(),
                ),
                child: _setGridText(index),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    if (index == 11) {
      if (code.isNotEmpty) {
        setState(() {
          code.removeLast();
        });
      }
      return;
    }
    if (code.length < 4) {
      setState(() {
        switch (index) {
          case 9:
            break;
          case 10:
            code.add('0');
            break;
          case 11:
            break;
          default:
            code.add('${index + 1}');
            break;
        }
      });
    }
  }

  Widget _setGridText(int index) {
    switch (index) {
      case 9:
        return Text('.');
      case 10:
        return Text('0');
      case 11:
        return Icon(Icons.backspace_outlined, size: 28.0);
      default:
        return Text("${index + 1}");
    }
  }

  Container _buildField(String text) {
    return Container(
      height: 52.0,
      width: 52.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: .center,
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
