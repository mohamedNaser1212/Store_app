import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChanged,required this.hinttext,this.inputType,this.obscureText=false}) ;
  String? hinttext;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: obscureText!,
      keyboardType: inputType,

      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText:hinttext,
        hintStyle: TextStyle(
            color: Colors.black
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8)

        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(16)


        ),



      ),


    );


  }
}
