
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/controllers/user_controller.dart';
import 'package:medicine_remainder_app/models/user.dart';
import 'package:medicine_remainder_app/screens/Profiles/add_user.dart';
import 'package:medicine_remainder_app/screens/Profiles/edit_user.dart';
import 'package:medicine_remainder_app/widgets/button.dart';
import 'package:medicine_remainder_app/widgets/category_card.dart';



class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  final _userController = Get.put(UserController());
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    _userController.getUsers();

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _userController.getUsers();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(height: 25,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMd().format(DateTime.now()),
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )),
                      Text("Today",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                MyButton(
                  label: "Add Users",
                  onTap: () async {
                     Navigator.pushNamed(context,AddUserPage.routeName);
                      _userController.getUsers();
                  },
                  icon: Icons.add,
                  height: 25,
                )

              ],
            ),
          ),
             SizedBox(height:25),


          Expanded(
            child:GridView.builder(
              itemCount: _userController.userList.length,

              padding:const EdgeInsets.only(left:20,right:20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context,index) {
                User user = _userController.userList[index];
                String? svg;
                if(user.gender == "Male"){
                  svg = "assets/icons/male.svg";
                }else if(user.gender == "Female"){
                  svg = "assets/icons/female.svg";
                }else{
                  svg = "assets/icons/male.svg";
                }
                return CategoryCard(
                title: user.name.toString(),
                svgSrc: svg,
                press: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUser(user:user),
                  ),
                );},
              );
              }
            )
        ),




          ],
      ),
    );
  }



}
