
import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/widgets/custom_button.dart';
import 'package:medicine_remainder_app/widgets/header_text.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  final buttons = [
    CustomButton(
      icon: Icons.note,
      color: Colors.green,
      label: "Physicals",
      onPressed: () {},
    ),
    CustomButton(
      icon: Icons.note,
      color: Colors.lightBlue,
      label: "Consulatations",
      onPressed: () {},
    ),
    CustomButton(
      icon: Icons.note,
      color: Colors.pinkAccent,
      label: "Medicine",
      onPressed: () {},
    ),
    CustomButton(
      icon: Icons.note,
      color: Colors.orangeAccent,
      label: "Pathology",
      onPressed: () {},
    ),
    CustomButton(
      icon: Icons.note,
      color: Colors.orangeAccent,
      label: "Discharge",
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText("Medicine Notes"),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buttons
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.all(10),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}