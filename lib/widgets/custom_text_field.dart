import 'package:flutter/material.dart';
import 'package:e_shop/constants.dart';

class CustomFormTextField extends StatelessWidget {
  late String label;
  late IconData icon;
  late bool isPassword;

  CustomFormTextField(
      {required this.label, required this.icon, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        obscureText: isPassword,
        cursorColor: KFourthColor,
        cursorHeight: 24,
        style: const TextStyle(
            color: KFourthColor, fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(fontSize: 18, color: KFourthColor),
          ),
          prefixIcon: Icon(
            icon,
            color: KFourthColor,
          ),
          filled: true,
          fillColor: KSecondColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: KFourthColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: KFifthColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red)),
          errorStyle: const TextStyle(
              color: Colors.redAccent, fontWeight: FontWeight.w500),
        ),
        validator: (value) {
          if (label == 'Name') {
            if (value!.isEmpty) {
              return 'Name can\'t be empty.';
            }
            if (value.length < 6) {
              return 'Name should be at least 6 character.';
            }
          }
          if (label == 'E-mail') {
            if (value!.isEmpty) {
              return 'E-mail is required.';
            }
            bool emailValid =
                RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                    .hasMatch(value);
            if (!emailValid) {
              return 'Email Not valid.';
            }
          }
          if (label == 'Password') {
            if (value!.isEmpty) {
              return 'Password id required.';
            }
            if (value.length < 6) {
              return 'Password should be at least 8 character.';
            }
          }
        },
      ),
    );
  }
}
