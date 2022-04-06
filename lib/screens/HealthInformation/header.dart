
import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/widgets/search_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({ Key? key}) : super(key: key);

 
  final double _maxWidthForUsername = 200.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black, 
            size: 25,
          ),
        ),
        SizedBox(width: 20.0),
        SearchButton(onPressed: () {}), 
      ],
    );
  }

  Widget _title() { 
    return Text(
      "Good Morning",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _subtitle() {
    return Container(
      constraints: BoxConstraints(maxWidth: _maxWidthForUsername),
      child: Text(
        "dadasd",
        style: TextStyle(fontSize: 20),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _emoji() {
    return SizedBox(
      width: 20,
      child: Image.asset(
        "waving-hand-emoji",
        height: 20,
        width: 20,
      ),
    );
  }
}