import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicine_remainder_app/constants.dart';

import '../controllers/note_controller.dart';
import '../models/Note.dart';

class NoteCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String description;
  final Function()? press;
  final Note? note;
  const NoteCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.description,
    required this.press,
    required this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteController = Get.put(NoteController());
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              // spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.only(left:10.0,top:20,right:20,bottom: 20),
              child: Column(
                children: <Widget>[
                    Row(
                      children: [
                        SizedBox(child:SvgPicture.asset(svgSrc),height:65,width:85) ,
                        SizedBox(width:10),
                        SizedBox(width:130, child:Column(children: [
                          Text(
                          title,
                          textAlign: TextAlign.center,

                        ),
            SizedBox(height:15),
            Text(
              description,
              textAlign: TextAlign.center,

            ),
            ],)),
                      SizedBox(width:40),
                        Column(children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: () =>  {_noteController.delete(note!)}, icon: Icon(Icons.delete),color:Colors.red),


                        ],)

                      ],
                    )
                  // SizedBox(child:SvgPicture.asset(svgSrc),height:85,width:85) ,


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}