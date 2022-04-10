import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_remainder_app/constants.dart';

import '../../models/user.dart';

class EditUser extends StatelessWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    print(user.toJson());
    String? svg;
    print(user.toJson());
    if(user.gender == "Male"){
      svg = "assets/icons/male.svg";
    }else if(user.gender == "Female"){
      svg = "assets/icons/female.svg";
    }else{
      svg = "assets/icons/male.svg";
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => const ReminderScreen(),
            //     ),
            //     (Route<dynamic> route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body:Container(
        padding: const EdgeInsets.only(left:15,top:20,right:15),
        child:GestureDetector(
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child:ListView(
            children: [
              Center(
                child:Stack(
                  children: [
                    Container(
                      width:130,
                      height:130,

                      decoration: BoxDecoration(
                        border:Border.all(width:4,color:Colors.white),
                        boxShadow:[
                          BoxShadow(spreadRadius: 2,blurRadius: 10,color:Colors.black.withOpacity(0.1))
                        ],
                        shape:BoxShape.circle,
                      ),
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                          SizedBox(child:SvgPicture.asset(svg),height:85,width:85) ,
                          Spacer(),

                        ],
                      ),
                    ),

                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}
