import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/models/reminder.dart';
import 'package:medicine_remainder_app/screens/Reminder/add_reminder.dart';
import 'package:medicine_remainder_app/widgets/button.dart';
import 'package:medicine_remainder_app/widgets/reminder_tile.dart';

import '../../controllers/reminder_controller.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
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
                  label: "Add Reminder",
                  onTap: () async {
                      Navigator.pushNamed(context,AddReminderPage.routeName);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //       builder: (BuildContext context) =>
                    //           const AddReminderPage(),
                    //     ),
                    //     (Route<dynamic> route) => false);
                    _reminderController.getReminders();
                  },
                  icon: Icons.add,
                  height: 25,
                )
                // ResponsiveButton(width:150,isResponsive: true,)
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: kPrimaryColor,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  itemCount: _reminderController.reminderList.length,
                  itemBuilder: (_, index) {
                    print(_reminderController.reminderList.length);
                    Reminder reminder = _reminderController.reminderList[index];
                    // print(reminder.toJson());
                    if (reminder.repeat == 'Daily') {
                      DateTime date =
                          DateFormat.jm().parse(reminder.time.toString());
                      var myTime = DateFormat("HH:mm").format(date);
                      print(myTime);
                     
                      return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: _reminderController.reminderList.length,
                          child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, reminder);
                                },
                                child: ReminderTile(reminder),
                              )
                            ],
                          ))));
                    }
                    if (reminder.date ==
                        DateFormat.yMd().format(_selectedDate)) {
                      return AnimationConfiguration.staggeredGrid(
                          position: index,
                          columnCount: _reminderController.reminderList.length,
                          child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, reminder);
                                },
                                child: ReminderTile(reminder),
                              )
                            ],
                          ))));
                    } else {
                      return Container();
                    }
                  });
            }),
          )
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
