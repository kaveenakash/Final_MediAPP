import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/constants.dart';

class MyButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function() onTap;
  final double? height;
  const MyButton({Key? key, required this.label, required this.onTap, this.icon,this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor)
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!=null ?Icon(
            icon,
            color: Colors.white,
            size: 14,
          ):Container(),
          SizedBox(width: 10,height:height),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
