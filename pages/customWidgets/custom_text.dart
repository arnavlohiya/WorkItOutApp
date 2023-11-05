import "package:flutter/material.dart";

class HeaderText extends StatelessWidget{
  String headerType = "h1";
  String data = "";
  HeaderText(this.data, this.headerType);

  @override
  Widget build(BuildContext context) {
    double fontsize = 14;
    switch(headerType){
      case "h1":
        fontsize = 20;
        break;
      case "h2":
        fontsize = 18;
        break;
      case "h3":
        fontsize = 16;
        break;
      default:
        fontsize = 14;
        break;
    }
    return Text(data, style: TextStyle(fontSize:fontsize, fontFamily: 'Lato', fontWeight: headerType == "h3"? FontWeight.normal: FontWeight.bold ),);
  }

}
