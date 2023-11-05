import 'dart:io';

import 'package:flutter/material.dart';
import 'customWidgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
//import 'package:honorsproject/user_auth/login.dart';

import '../api_connections/api_connections.dart';
import 'customWidgets/custom_dropdown.dart';
import 'customWidgets/custom_text.dart';

class Signup extends StatelessWidget{
  List<CustomTextField> listTextFields=[];
  DropDownWidget dropDown = DropDownWidget(listOfStrings: const ["Student","Faculty","Other"]);
  Signup(){
    //TextField controllers
    TextEditingController fNameController = TextEditingController();
    TextEditingController lNameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController contactController = TextEditingController();

    listTextFields = [
      CustomTextField(controller: fNameController, label: "First Name"),
      CustomTextField(controller: lNameController, label: "Last Name"),
      CustomTextField(controller: usernameController, label: "Username"),
      CustomTextField(controller: passwordController, label: "Password"),
      CustomTextField(controller: emailController, label: "Email"),
      CustomTextField(controller: contactController, label: "Contact Number"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: [
            Container(
                height: screenHeight,
            ),
            SingleChildScrollView(
              child: Container(
                //height: screenHeight,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height/4,
                        alignment: Alignment.center,
                        child: HeaderText("Sign Up", "h1")
                    ),
                    listTextFields[0],
                    SizedBox(height: 10),
                    listTextFields[1],
                    SizedBox(height: 10),
                    listTextFields[2],
                    SizedBox(height: 10),
                    listTextFields[3],
                    SizedBox(height: 10),
                    listTextFields[4],
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: screenWidth*0.50,
                            child: listTextFields[5]),
                        SizedBox(width: 10,),
                        Container(
                          child: dropDown,
                          //width: screenWidth*0.25
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Already have an account?"),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Login"))
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(onPressed: () async {
                      print("You have pressed sign up");
                      if (validate()){
                        bool isAttemptSuccessful = await attemptSignup(
                          listTextFields[0].controller.text,
                          listTextFields[1].controller.text,
                          listTextFields[2].controller.text,
                          listTextFields[3].controller.text,
                          listTextFields[4].controller.text,
                          listTextFields[5].controller.text,
                          dropDown.first,
                        );
                        if(isAttemptSuccessful){
                          Navigator.pop(context, [listTextFields[2].controller.text,listTextFields[3].controller.text]);
                        }
                      }

                    }, child: Text("Sign up"))

                  ],
                ),

              ),
            ),
          ],
        )


    );

  }

  bool validate(){
    bool validationLoopCheck=true;
    for(int i = 0; i<listTextFields.length; i++ ){
      if(listTextFields[i].isValidated !=null && !listTextFields[i].isValidated){
        validationLoopCheck=false;
      }
    }
    return validationLoopCheck;
  }

  Future<bool> attemptSignup(String fName, String lName, String username, String password, String email, String contact, String role) async {
    try{
      var apiCallResult = await http.post(
          Uri.parse(API.signup),
          body: {
            'fName' : fName,
            'lName' : lName,
            'username' : username,
            'password': password,
            'email' : email,
            'contact' : contact,
            'role' : role

          }
      );
      if(apiCallResult.body =='1'){
        print("user Has been registered");
        return true;
      }else{
        print('there has been some issue during sign up attempt');
        return false;
      }
    }catch(e){
      e.toString();
      return false;
    }
  }
}

