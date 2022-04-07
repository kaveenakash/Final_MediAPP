import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/screens/Login/components/body.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}