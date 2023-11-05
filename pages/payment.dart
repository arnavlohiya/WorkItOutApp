import 'package:flutter/material.dart';
import 'package:workitout/pages/dashboard.dart';

import 'data_model.dart';

class PaymentPage extends StatelessWidget {
  double amount =0.0;
  int skillSessions;
  int durationValue;
  PaymentPage(this.amount, this.skillSessions, this.durationValue, {super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _creditCardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          title: const Text('Payment Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20 ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Amount: $amount", style: TextStyle( fontSize: 25)),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _creditCardController,
                  decoration: const InputDecoration(labelText: 'Credit Card Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a credit card number';
                    }
                    if (!isValidCreditCard(value)) {
                      return 'Invalid credit card number';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryDateController,
                        decoration: const InputDecoration(labelText: 'Expiry Date'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the expiry date';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        decoration: const InputDecoration(labelText: 'CVV'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter CVV';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform the payment processing here
                      // You can access the entered data using the controllers
                      //Dashboard
                      //Data.daysLeft = ;
                      Data.sessionsLeft += skillSessions;
                      Data.daysLeft += (durationValue*30)!;
                      //Data.points+= amount*10;
                      Data.totalSessions +=skillSessions;
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard() ));

                    }
                  },
                  icon: Icon(Icons.payment),
                  label: Text('Make Payment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidCreditCard(String cardNumber) {
    if (cardNumber =="1111222233334444"){
      return true;
    }
    // Remove any non-numeric characters and reverse the card number
    String sanitizedCardNumber = cardNumber.replaceAll(RegExp(r'\D'), '').split('').reversed.join('');

    int sum = 0;
    for (int i = 0; i < sanitizedCardNumber.length; i++) {
      int digit = int.parse(sanitizedCardNumber[i]);

      // Double every second digit from the right (odd-indexed digits)
      if (i % 2 == 1) {
        digit *= 2;

        // If the doubled value is greater than 9, subtract 9 from it
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
    }

    // The card number is valid if the sum is a multiple of 10
    return sum % 10 == 0;
  }
}