import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/controllers/user_controller.dart';
import 'package:medicine_remainder_app/models/user.dart';
import 'package:medicine_remainder_app/screens/Profiles/profiles_screen.dart';
import 'package:medicine_remainder_app/widgets/button.dart';
import 'package:medicine_remainder_app/widgets/input_field.dart';

class AddUserPage extends StatefulWidget {
  static const routeName = '/add-user';
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddUserPage> {
  final UserController _userController = Get.put(UserController());
  final TextEditingController _userNameController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _time = DateFormat("hh:mm a").format(DateTime.now()).toString();
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["Male","Female"];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
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
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add User",
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15,),
              MyInputField(
                title: "User Name",
                hint: "Enter user name",
                controller: _userNameController,
              ),
              MyInputField(
                title: "Birth Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    print("Hi There");
                    _getDateFromUser();
                  },
                ),
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _colorPallete(),
                  MyButton(
                      label: "Create User",
                      onTap: () => _validateName(),
                      icon: null,
                      height: 50)
                ],
              ),
            ],
          ))),
    );
  }

  _validateName() {
    if (_userNameController.text.isNotEmpty) {
      _addUserToDb();

      Navigator.pop(context);

    } else if (_userNameController.text.isEmpty) {

      Get.snackbar("Required", "All fields are required!",
          icon: Icon(Icons.warning_amber_rounded));
    }
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2121));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print("its null or something is wrong");
    }
  }



  _addUserToDb() async {
    int value = await _userController.AddUser(
        user: User(
          name:_userNameController.text,
      date: DateFormat.yMd().format(_selectedDate),
      color: _selectedColor,
          gender:_selectedRepeat
    ));
    _userController.getUsers();
    _showMyDialog(_userNameController.text);


  }
  Future<void> _showMyDialog(String name) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Added Successfully'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text('user ${name} created Successfully'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                _userController.getUsers();
                Navigator.pop(context);
                // Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? kPrimaryColor
                      : index == 1
                          ? kTextSecondary
                          : Colors.pink,
                  child: _selectedColor == index
                      ? Icon(Icons.done, color: Colors.white, size: 16)
                      : Container(),
                ),
              ));
        })),
      ],
    );
  }
}
