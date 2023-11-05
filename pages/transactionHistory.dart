import 'package:flutter/material.dart';
class WorkoutHistoryScreen extends StatefulWidget {
  @override
  _WorkoutHistoryScreenState createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  TextEditingController workout1Controller = TextEditingController();
  TextEditingController workout2Controller = TextEditingController();
  TextEditingController workout3Controller = TextEditingController();
  TextEditingController workout4Controller = TextEditingController();
  TextEditingController workout5Controller = TextEditingController();
  TextEditingController workout6Controller = TextEditingController();

  int totalPoints = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout History'),
      ),
      backgroundColor: Colors.yellow, // Set the background color to yellow
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Points Earned: $totalPoints',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          WorkoutContainer('Workout 1', workout1Controller),
          WorkoutContainer('Workout 2', workout2Controller),
          WorkoutContainer('Workout 3', workout3Controller),
          WorkoutContainer('Workout 4', workout4Controller),
          WorkoutContainer('Workout 5', workout5Controller),
          WorkoutContainer('Workout 6', workout6Controller),
        ],
      ),
    );
  }
}

class WorkoutContainer extends StatefulWidget {
  final String workoutName;
  final TextEditingController controller;

  WorkoutContainer(this.workoutName, this.controller);

  @override
  _WorkoutContainerState createState() => _WorkoutContainerState();
}

class _WorkoutContainerState extends State<WorkoutContainer> {
  var workout1Controller;
  var workout2Controller;
  var workout3Controller;
  var workout4Controller;
  var workout5Controller;
  var workout6Controller;
  var totalPoints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white, // Background color for the container
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.workoutName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Points Earned:',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Row(
                      children: [
                      Text("🏆"),
                        SizedBox(width: 8.0), // Add spacing between the icon and text
                        Text(
                          '10 Coins', // Replace with your desired text
                          style: TextStyle(fontSize: 16.0), // Customize text style
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}