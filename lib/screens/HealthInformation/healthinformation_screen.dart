

// import 'package:file_manager/app/shared_components/custom_button.dart';
// import 'package:file_manager/app/shared_components/file_list_button.dart';
// import 'package:file_manager/app/shared_components/header_text.dart';
// import 'package:file_manager/app/shared_components/search_button.dart';
// import 'package:file_manager/app/utils/helpers/app_helpers.dart';
// import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/screens/HealthInformation/category.dart';
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
import './header.dart';
class HealthInformationScreen extends StatefulWidget {
  const HealthInformationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HealthInformationScreenState();

}

class _HealthInformationScreenState extends State<HealthInformationScreen>{
  @override
  Widget build(BuildContext context) {
    var items = ["Item 1", "Item2"];
    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TopBar(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: _StorageChart(usage: controller.usage),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top:20,bottom: 20),
                  child: Category(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: _Recent(
                //     // data: controller.recent,
                //   ),     
                // ),

                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left:10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 23,
                        spreadRadius: -13,
                        color: kShadowColor,
                      ),
                    ],
                  ),

                  child: Row(
                    children: <Widget>[
                      SizedBox(height:50,width:50,child:  SvgPicture.asset(
                        "assets/icons/folder.svg",
                      ),),
                      // Image.asset("bluefolder_ccexpress",width:10,height:10),

                      SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Blood Report",
                            ),
                            Text("Mother last month blood report")
                          ],
                        ),
                      ),
                      SizedBox(width:50,child:Column(children:[IconButton(icon:Icon(Icons.delete),color:Colors.red, onPressed: () {  },),IconButton(icon:Icon(Icons.download),color:Colors.blue, onPressed: () {  },),]) ,)
                    ],
                  ),
                ),

              ]),
              hasScrollBody: false,
            )
          ],
        ),
      ),
    );
  }


}