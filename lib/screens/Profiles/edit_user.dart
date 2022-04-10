import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/widgets/input_field.dart';
import 'package:medicine_remainder_app/controllers/user_controller.dart';

import '../../models/user.dart';
import '../../widgets/button.dart';


class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState(user:user);
}

class _EditUserState extends State<EditUser> {
  final User user;
   _EditUserState({Key? key,required this.user}) : super();

  final TextEditingController _userNameController = TextEditingController();
  final UserController _userController = Get.put(UserController());
  String _selectedRepeat = "None";
  List<String> repeatList = ["Male","Female"];



  @override
  Widget build(BuildContext context) {
    _selectedRepeat = _selectedRepeat == "None" ?user.gender.toString():_selectedRepeat;

    String? svg;
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
              ),
              SizedBox(height:5),
              Text(
                user.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),

              ),
              SizedBox(height:25),
              MyInputField(
                title: "Name",
                hint: user.name.toString(),
                controller: _userNameController,
              ),

              MyInputField(
                title: "Gender",
                hint: _selectedRepeat,
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  underline: Container(height: 0),
                  items:
                  repeatList.map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      child: Text(value!, style: TextStyle(color: Colors.grey)),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                ),
              ),

              SizedBox(height: 45,),
              MyButton(label:"Save",onTap: () => _validateName(user),height:45),
              SizedBox(height: 5,),
              MyButton(label:"Delete User",onTap: () => {},color: Colors.red,height:45),
            ],
          )
        )
      )
    );


  }

  _validateName(User user) {

      _updateUserFromDb(user);
      Navigator.pop(context);


  }
  _updateUserFromDb(User user) async {
     _userController.updateUser(_userNameController.text == null ?user.name.toString():_userNameController.text.toString(),_selectedRepeat,user.id!);
    _userController.getUsers();

  }

  _deleteUser()async{

  }

}
