import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine_remainder_app/screens/Login/login_screen.dart';
import 'package:medicine_remainder_app/screens/Signup/signup_screen.dart';

import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to MediCare",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
            ),
            SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            Lottie.asset('assets/welcome.json'),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                 Navigator.of(context)
                    .pushNamed(LoginScreen.routeName);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                 Navigator.of(context)
                    .pushNamed(SignUpScreen.routeName);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}