import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/models/reminder.dart';
import 'package:medicine_remainder_app/screens/Reminder/add_reminder.dart';
import 'package:medicine_remainder_app/services/notification_services.dart';
import 'package:medicine_remainder_app/widgets/button.dart';
import 'package:medicine_remainder_app/widgets/button_widget.dart';
import 'package:medicine_remainder_app/widgets/reminder_tile.dart';
import 'package:medicine_remainder_app/widgets/category_card.dart';
// import '../../components/category_card.dart';
import '../../controllers/reminder_controller.dart';


class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  DateTime _selectedDate = DateTime.now();
  final _reminderController = Get.put(ReminderController());

  
  @override
  Widget build(BuildContext context) {
    _reminderController.getReminders();
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
                    
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const AddReminderPage(),
                        ),
                        (Route<dynamic> route) => false);
                    _reminderController.getReminders();
                  },
                  icon: Icons.add,
                  height: 25,
                )
                // ResponsiveButton(width:150,isResponsive: true,)
              ],
            ),
          ),
             SizedBox(height:25),
             Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding:const EdgeInsets.only(left:20,right:20),
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/female.png",
                          press: () {},
                        ),
                      
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),   

          ],
      ),
    );
  }

  _showBottomSheet(BuildContext context, Reminder reminder) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (_) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
                color: const Color(0xFF2e3253).withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  reminder.isCompleted == 1
                      ? Column(children: [
                          _bottomSheetButton(
                              label: "Delete Reminder",
                              onTap: () {
                                _reminderController.delete(reminder);
                                Navigator.pop(context);
                              },
                              clr: Colors.red[300]!,
                              context: context),
                          SizedBox(
                            height: 10,
                          ),
                          _bottomSheetButton(
                              label: "Close",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              isClose: true,
                              clr: Colors.red[300]!,
                              context: context),
                          SizedBox(
                            height: 20,
                          )
                        ])
                      : Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          _bottomSheetButton(
                              label: "Reminder Completed",
                              onTap: () {
                                _reminderController
                                    .markRemindCompleted(reminder.id!);

                                Navigator.pop(context);
                              },
                              clr: kPrimaryColor,
                              context: context),
                          SizedBox(
                            height: 10,
                          ),
                          _bottomSheetButton(
                              label: "Delete Reminder",
                              onTap: () {
                                _reminderController.delete(reminder);
                                Navigator.pop(context);
                              },
                              clr: Colors.red[300]!,
                              context: context),
                          SizedBox(
                            height: 10,
                          ),
                          _bottomSheetButton(
                              label: "Close",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              isClose: true,
                              clr: Colors.red[300]!,
                              context: context),
                          SizedBox(
                            height: 20,
                          ),
                        ])
                  // ButtonWidget(
                  //     backgroundcolor: Colors.red,
                  //     text: "Delete Reminder",
                  //     textColor: Colors.white)
                ],
              ),
            ),
          );
        });
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: isClose == true ? Colors.black : clr),
            borderRadius: BorderRadius.circular(20),
            color: isClose == true ? Colors.white : clr,
          ),
          child: Center(
              child: Text(label,
                  style: isClose
                      ? TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)
                      : TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white))),
        ));
  }
}
