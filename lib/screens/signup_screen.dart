import 'package:e_shop/constants.dart';
import 'package:e_shop/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUpScreen';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KThirdColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: const [
                Icon(
                  FontAwesomeIcons.shopify,
                  size: 140,
                  color: KFourthColor,
                ),
                Text(
                  "E-SHOP",
                  style: TextStyle(
                      color: KFourthColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 36),
                )
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormTextField(
                  label: "Name",
                  icon: FontAwesomeIcons.solidUserCircle,
                  isPassword: false,
                ),
                CustomFormTextField(
                  label: "E-mail",
                  icon: FontAwesomeIcons.solidEnvelope,
                  isPassword: false,
                ),
                CustomFormTextField(
                  label: "Password",
                  icon: FontAwesomeIcons.lock,
                  isPassword: true,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 4),
            child: ElevatedButton(
                onPressed: () {
                _formKey.currentState!.validate();
                },
                child: const Text('Signup'),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(KFourthColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: const BorderSide(color: KFifthColor))))),
          ),
        ],
      ),
    );
  }
}
