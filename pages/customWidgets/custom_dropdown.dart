import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget{
  String selectedGlobal = "Student";
  List<String> listOfStrings;
  String first="";
  DropDownWidget({required this.listOfStrings}){
    first = listOfStrings.first;
    selectedGlobal=first;
  }

  @override
  State<StatefulWidget> createState() => _DropDownWidgetState(list: listOfStrings, first: first);

}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> list;
  String currentlySelected = "";

  _DropDownWidgetState({required this.list, required String first}) {
    currentlySelected = first;
  }
  String getSelected(){
    return currentlySelected;
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: currentlySelected,
      items: list.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          widget.selectedGlobal = value!;
          currentlySelected = value!;
        });
      },

    );
  }
}
