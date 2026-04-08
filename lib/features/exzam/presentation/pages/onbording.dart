import 'package:flutter/material.dart';

import 'package:guruh1/assets/images/images.dart';
import 'package:guruh1/assets/images/colors.dart';
import 'package:guruh1/features/exzam/presentation/pages/login.dart';
import 'package:guruh1/features/exzam/presentation/pages/sign_up.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final List<Map<String, dynamic>> pages = [
    {
      'images': OnborImages.rasm1,
      'title': 'Gain total control \n of your money',
      'suptitle': 'Become your own money manager\n and make every cent count',
    },
    {
      'images': OnborImages.rasm2,
      'title': 'Know where your \n money goes',
      'suptitle':
          'Track your transaction easily, \n with categories and financial report ',
    },

    {
      'images': OnborImages.rasm3,
      'title': 'Planning ahead',
      'suptitle': 'Setup your budget for each category\n so you in control ',
    },
  ];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: .topLeft,
              child: TextButton(
                onPressed: () {},
                child: Text('Skip', style: TextStyle(fontSize: 20)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    spacing: 12,
                    children: [
                      Image(
                        image: AssetImage(page['images']),
                        height: 420,
                        width: 420,
                      ),
                      Text(
                        page['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),

                      Text(
                        page['suptitle'],
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          inherit: true,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SmoothPageIndicator(controller: controller, count: pages.length),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
