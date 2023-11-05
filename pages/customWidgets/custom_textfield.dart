import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  dynamic isValidated = null;
  CustomTextField ({required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.label=="Password"?true:false,
        onChanged:(value){
          validate(widget.label, value);
          setState(() {});
        },
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label, style: TextStyle(color: widget.isValidated==null?Colors.blue:widget.isValidated? Colors.green :Colors.red),),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.isValidated==null?Colors.blueAccent:widget.isValidated? Colors.green :Colors.red), // Color when the TextField is focused
          ),//widget.isValidated? Colors.green :Colors.red
          hintText: widget.label,
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.grey[100],
        )
    );
  }

  String validate(String type, String value){
    //print(type);
    String result="";
    switch(type){
      case 'First Name' || 'Last Name':
        widget.isValidated = !value.isEmpty;
        print(widget.isValidated);
        result= widget.isValidated?"${type} can't be empty":'true';;
        break;
      case 'Username' || 'Password':
        print(type);
        widget.isValidated = !(value.length <8);
        result= widget.isValidated?"${type} must be 8 characters atleast":'true';
        break;
      case 'Email':
        print(type);
        final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
        widget.isValidated =emailRegExp.hasMatch(value);
        result= widget.isValidated?'true': "Enter a valid email" ;
        break;
      case 'Contact Number':
        print(type);
        widget.isValidated = ((int.tryParse(value)!=null) && value.length == 10);
        result= widget.isValidated?'true':'Enter a valid contact number';
        break;
      default:
        print(type);
        result='false';
    }
    return result;
  }
}