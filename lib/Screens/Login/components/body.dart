import 'dart:convert';
import 'dart:async';
import 'package:flutter_auth/Screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/constants.dart';

class Body extends StatelessWidget {

  Future<List> _login() async{
    final response = await http.post("https://pawsandtailss.000webhostapp.com/php_login/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);
    var login;
    if(datauser==null){
      login=false;
    } else{
      login=true;
    }

    return login;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/cat.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your User",
              onChanged: (value) {
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
              },
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColorButtonRegLog,
              press: () {
                // ignore: unrelated_type_equality_checks
                _login() != true? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        }
                    )
                ) : print("ERROR");
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}