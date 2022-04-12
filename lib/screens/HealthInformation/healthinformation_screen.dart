

// import 'package:file_manager/app/shared_components/custom_button.dart';
// import 'package:file_manager/app/shared_components/file_list_button.dart';
// import 'package:file_manager/app/shared_components/header_text.dart';
// import 'package:file_manager/app/shared_components/search_button.dart';
// import 'package:file_manager/app/utils/helpers/app_helpers.dart';
// import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/screens/HealthInformation/category.dart';
import 'package:medicine_remainder_app/widgets/category_card.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// // binding
// part '../../bindings/home_binding.dart';

// // controller
// part '../../controllers/home_controller.dart';

// // model
// part '../../models/usage.dart';
// part '../../models/user.dart';

// component
// part '../components/category.dart';
// part '../components/header.dart';
// part '../components/recent.dart';
// part '../components/storage_chart.dart';
import '../../controllers/note_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/Note.dart';
import '../../models/user.dart';
import '../../widgets/note_card.dart';
import '../Profiles/edit_user.dart';
import './header.dart';
import 'add_report_dialog_widget.dart';
class HealthInformationScreen extends StatefulWidget {
  const HealthInformationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HealthInformationScreenState();

}

class _HealthInformationScreenState extends State<HealthInformationScreen>{
  final _noteController = Get.put(NoteController());
  final _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var items = ["Item 1", "Item2"];
    _noteController.getNotes();
    _userController.getUsers();
    var noteList = <Note>[].obs;
    noteList = _noteController.noteList;
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                noteList = _noteController.noteList;
              });

            },
            icon: Icon(
              Icons.refresh_rounded,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [

          // SizedBox(height: 25,),

          // SizedBox(height:25),
          Category(),

          Expanded(
              child:GridView.builder(
                  itemCount: _noteController.noteList.length,

                  padding:const EdgeInsets.only(left:20,right:20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 140,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context,index) {
                    Note note = noteList[index];

                    return SizedBox(height:15,child:NoteCard(
                      title: note.title.toString(),
                      description:note.description.toString(),
                      svgSrc: "assets/icons/male.svg",
                     note:note,
                      press: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => EditUser(user:user),
                        //   ),
                        // );
                        },
                    ));
                  }
              )
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(context: context,barrierDismissible: true, builder: (BuildContext context) { return AddReportDialogWidget(); }),
        child:Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
    );
  }


}