import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:workitout/pages/dashboard.dart';
import 'signup.dart';
import 'package:workitout/api_connections/api_connections.dart';

import 'customWidgets/custom_textfield.dart';
import 'customWidgets/custom_textfield.dart';

class Login extends StatelessWidget{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,

          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height/3,
                  alignment: Alignment.center,
                  child: Text("Login")
              ),
              SizedBox(height:10),
              CustomTextField(
                  controller: usernameController,
                  label: "Username"
              ),
              SizedBox(height:10),
              CustomTextField(
                  controller: passwordController,
                  label: "Password"
              ),
              SizedBox(height:10),
              Center(
                child: Row(
                  children: [
                    Text("Don't have an acc?"),
                    TextButton(onPressed: ()async{
                      final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                      usernameController.text = result[0];
                      passwordController.text = result[1];
                      Fluttertoast.showToast(msg: "You have successfuly signed up!");
                    }, child: Text("Sign up"))
                  ],
                ),
              ),

              SizedBox(height:10),
              ElevatedButton(onPressed: ()async{
                var res = await attemptLogin(usernameController.text.trim(), passwordController.text.trim());
                print(res.toString());
                !res? Fluttertoast.showToast( msg: "Wrong credentials"):Fluttertoast.showToast( msg: "You have logged in successfuly");
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

}

//Start of functions
Future<bool> attemptLogin(String user, String pass) async {
  try{
    var apiCallResult = await http.post(
        Uri.parse(API.login),
        body: {
          'username' : user,
          'password' : pass,
        }
    );
    print(apiCallResult.body);
    return apiCallResult.body=='1'?true:false;
  }catch(e){
    print(e.toString());
    return false;
  }
}