import 'package:flutter/material.dart';
import 'package:workitout/pages/payment.dart';

import 'data_model.dart';



class newSession extends StatefulWidget {
  @override
  _newSession createState() => _newSession();
}

class _newSession extends State<newSession> {
  int durationValue = 1;
  int skillSessionsValue = 1;
  int amountValue = 0;

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text("Duration",textAlign: TextAlign.left,),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: durationValue,
                        onChanged: (value) {
                          setState(() {
                            durationValue = value!;
                            Data.numOfMonths = durationValue;
                            print(durationValue);
                          });
                        },
                      ),
                      Text("1 month"),
                      Radio(
                        value: 3,
                        groupValue: durationValue,
                        onChanged: (value) {
                          setState(() {
                            durationValue = value!;
                            Data.numOfMonths = durationValue;
                            print(durationValue);
                          });
                        },
                      ),
                      Text("3 months"),
                      Radio(
                        value: 6,
                        groupValue: durationValue,
                        onChanged: (value) {
                          setState(() {
                            durationValue = value!;
                            Data.numOfMonths = durationValue;
                            print(durationValue);
                          });
                        },
                      ),
                      Text("6 months"),
                    ],
                  ),
              SizedBox(height: 30),
              Text("Work Out Sessions"),


                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            skillSessionsValue = skillSessionsValue > 1 ? skillSessionsValue - 1 : 1;
                          });
                        },
                      ),
                      Text(skillSessionsValue.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            skillSessionsValue++;
                          });
                        },
                      ),
                    ],
                  ),
              SizedBox(height: 30),
              Text("Amount"),

             TextFormField(
                keyboardType: TextInputType.number,
                controller: amountController,
                onChanged: (value) {
                  setState(() {
                    amountValue = int.tryParse(value) ?? 0;
                  });
                },
              ),

              SizedBox(height: 30),
              ElevatedButton(onPressed: () {
                //lets link these two pages.
                //print(amountController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(double.parse(amountController.text.toString()), skillSessionsValue, durationValue),
                  ),
                );

              },child: const Text("Pay")),
            ],
          ),
      ),

    );
  }
}
