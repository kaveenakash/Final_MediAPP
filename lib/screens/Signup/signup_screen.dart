import 'package:flutter/material.dart';

import 'package:medicine_remainder_app/screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}