import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workitout/pages/transactionHistory.dart';
import 'package:workitout/pages/userProfile.dart';
import 'data_model.dart';
import 'newSession.dart';
import 'payment.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // static int points=0;
  // static int sessions = 100;
  // static int completedsessions = 31;
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {

    int remainingdays = Data.daysLeft; //Data.sessionsLeft - Data.completedsessions;

    double progress = (Data.completedsessions /
        Data.totalSessions*1.0); // Calculate progress as a percentage

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Use the menu icon for the hamburger
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open the end drawer
              },
            );
          },
        ),
        title: const Text(
          'WorkItOut',
          style: TextStyle(
            fontFamily: 'WORKITOUT',
            fontSize: 48,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '🏆: ${Data.points} points',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container to display details above the buttons
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.yellow,
                      child: Center(
                          child: Text(
                            'Welcome, you have $remainingdays days left to reach your goal!',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign
                                .center, // This will center-align the text within the Text widget
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: Text(
                        'Sessions left: ${Data.sessionsLeft}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    // Progress bar
                    LinearProgressIndicator(
                      value: progress, // Value between 0.0 and 1.0 (percentage)
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      minHeight: 40.0,
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the Check in page
                          setState(() {
                            Data.points+=5;
                            Data.completedsessions++;
                            Data.sessionsLeft--;
                            //print(Data.points);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(
                            fontSize: 46,
                          ),
                        ),
                        child: Text('Check in'),
                      ),
                    ),
                    Container(
                      child: showProgress? CircularProgressIndicator():Text("")
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Add a sidebar with Payment and Transactions buttons
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Account Details'),
              onTap: () {
                // Handle the Payment button click here
                Navigator.pop(context);
                // Navigate to the Payments page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horiz),
              title: Text('Set goals'),
              onTap: () {
                // Handle the Transactions button click here
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newSession()));
                // Add your action for the Transactions button
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_horiz),
              title: Text('Transaction History'),
              onTap: () {
                // Handle the Transactions button click here
                Navigator.pop(context);
                // Add your action for the Transactions button
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkoutHistoryScreen()));

              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About us'),
              onTap: () {
                // Handle the Transactions button click here
                Navigator.pop(context);
                // Add your action for the Transactions button
              },
            ),

          ],
        ),
      ),
    );
  }
}

/*
Positioned(
              left: 0, // Position at the left
              bottom: 0, // Position at the bottom
              child: Image.asset(
                  '/Users/arnavlohiya/StudioProjects/workitout/lib/assets/images'),
            ),
 */