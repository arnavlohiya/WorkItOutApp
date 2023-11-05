import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  var name = "Lorem Ipsum";
  var username = "dolersitamet";
  int userId = 1227269;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('WorkItOut'),
        backgroundColor: Colors.blue, // Set the app bar color to blue
      ),
      body: Container(
        color: Colors.yellow, // Set the background color to yellow
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Topmost Horizontal Row
              //SizedBox(height: 20), for formatting purpose
              Row(
                children: <Widget>[
                  // Left Vertical Row
                  Padding(
                    //padding: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      child: Expanded(
                        child:
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black12
                            ),

                          ),

                      )

                    //Container(height: 100, width: 100, color: Colors.black),
                  ), // Placeholder for the profile picture

                  // Right Vertical Row
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: $name'),
                        Text('Username: $username'),
                        Text('User ID: $userId'),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20), // Add space between rows

              // Second Horizontal Row
              ElevatedButton(
                onPressed: () {
                  // Handle "Change Password" button click
                },
                child: Text('Change Password'),
              ),

              SizedBox(height: 20), // Add space between rows

              // Third Horizontal Row
              ElevatedButton(
                onPressed: () {
                  // Handle "Set up location" button click
                },
                child: Text('Set up location'),
              ),

              SizedBox(height: 20), // Add space between rows

              // Fourth Horizontal Row
              ElevatedButton(
                onPressed: () {
                  // Handle "Transaction History" button click
                },
                child: Text('Transaction History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
