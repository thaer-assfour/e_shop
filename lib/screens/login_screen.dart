import 'package:e_shop/constants.dart';
import 'package:e_shop/screens/home_screen.dart';
import 'package:e_shop/screens/signup_screen.dart';
import 'package:e_shop/services/auth.dart';
import 'package:e_shop/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = Auth();

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
                  label: "E-mail",
                  icon: FontAwesomeIcons.solidEnvelope,
                  controller: _emailController,
                ),
                CustomFormTextField(
                  label: "Password",
                  icon: FontAwesomeIcons.lock,
                  controller: _passwordController,
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _auth
                        .signInByEmail(
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == 'Success') {
                        Navigator.pushNamed(context, HomeScreen.id);
                      } else {
                        Fluttertoast.showToast(
                            msg: value,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: KFourthColor,
                            textColor: KSecondColor,
                            fontSize: 16.0);
                      }
                    });
                  }
                },
                child: const Text('Login'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(KFourthColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: const BorderSide(color: KFifthColor))))),
          ),
          SizedBox(
            height: height / 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(color: KFourthColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
                child: const Text(
                  ' SignUp',
                  style: TextStyle(
                      color: KFourthColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
