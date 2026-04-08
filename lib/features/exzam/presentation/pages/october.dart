import 'package:flutter/material.dart';
import 'package:guruh1/assets/images/images.dart';

class October extends StatefulWidget {
  const October({super.key});

  @override
  State<October> createState() => _OctoberState();
}

class _OctoberState extends State<October> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: 28.5,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 25,
              foregroundImage: AssetImage('assets/images/rasm.jpeg'),
            ),
          ),
        ),
        title: SizedBox(
          height: 44,
          width: 130,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
              ),
            ),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.arrow_downward_rounded, color: Colors.blue),
                Text("Octaber", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notification_important, size: 40, color: Colors.blue),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Account Balance',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            '9400',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 29, 143, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.green,
                                  ),
                                  Icon(Icons.camera_enhance),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '5000',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(28),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.arrow_circle_up_sharp,
                                          color: Colors.red,
                                        ),
                                        Icon(
                                          Icons.camera_enhance,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    'Expenses',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '12000',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Spend Frequency',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(OnborImages.graph),
              height: 399,
              width: 400,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 20,
              children: [
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    child: Text(
                      'Today',
                      style: TextStyle(fontSize: 14, color: Colors.amber),
                    ),
                  ),
                ),
                Text(
                  'Week',
                  style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
                Text(
                  'Month',
                  style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
                Text(
                  'Year',
                  style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Recent Transacation',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 20,
              children: [
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.shopping_bag, color: Colors.amber),
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text('Shopping', style: TextStyle(fontSize: 16)),
                    Text(
                      'buy some grocery',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      '-120',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    Text(
                      '10:00 AM',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 20,
              children: [
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.subscriptions, color: Colors.deepPurple),
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text('Subscrition', style: TextStyle(fontSize: 16)),
                    Text(
                      'Disney + Annual....',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      '-80',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    Text(
                      '3:00 PM',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 20,
              children: [
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.food_bank, color: Colors.amber),
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text('Food', style: TextStyle(fontSize: 16)),
                    Text(
                      'Buy a ramen ',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      '-32',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    Text(
                      '07:30 PM',
                      style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue,
        onPressed: () {},
        child: Icon(Icons.add),shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: Colors.grey.shade300,
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor:Colors.blue ,
        unselectedItemColor: Colors.grey.shade400,
        useLegacyColorScheme: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.transcribe_outlined),
            label: 'transaction',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.storm), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'perofil'),
        ],
      ),
    );
  }
}
