import 'package:flutter/material.dart';
import 'package:e_shop/constants.dart';

class CustomTextField extends StatelessWidget {
  String? label;
  IconData? icon;

  CustomTextField({this.label, this.icon});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: TextFormField(
        obscureText: false,
        cursorColor: KFourthColor,
        cursorHeight: 24,
        style: const TextStyle(
            color: KFourthColor, fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          label:  Text(label!,style: const TextStyle(fontSize: 18,color: KFourthColor),),
          prefixIcon: Icon(icon,color: KFourthColor,),
          filled: true,
          fillColor: KSecondColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: KFourthColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: KFifthColor)),
        ),
      ),
    );
  }


}