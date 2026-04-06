import 'package:flutter/material.dart';
import 'package:guruh1/assets/images/images.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({super.key});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(OnborImages.rasm1),
              height: 300,
              width: 300,
            ),SizedBox(height: 20,),
            Text(
              'Your email is on the way',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),SizedBox(height: 16,),
             Text(
              'Check your email test@test.com and\nfollow the instructions to reet your',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color.fromARGB(255, 80, 68, 68),
              ),
            ),
            Text('password'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                  ),
                  child: Text(
                    'Back to Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
