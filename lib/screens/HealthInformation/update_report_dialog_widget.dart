import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/note_controller.dart';
import '../../models/Note.dart';
import 'form_widget.dart';
import 'note_form_widget.dart';

class UpdateReportDialogWidget extends StatefulWidget {

  final Note note;
  const UpdateReportDialogWidget({Key? key,required this.note}) : super(key: key);

  @override
  _UpdateReportDialogWidgetState createState() => _UpdateReportDialogWidgetState(note:note);
}

class _UpdateReportDialogWidgetState extends State<UpdateReportDialogWidget> {

  final Note note;
  _UpdateReportDialogWidgetState({Key? key,required this.note}) : super();

  final _formKey = GlobalKey<FormState>();
  final _noteController = Get.put(NoteController());
  String noteTitle = '';
  String noteDescription = '';
  int id = 0;

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   title = note.title.toString();
    //   description = note.description.toString();
    //   id = note.id!;
    // });
    noteTitle = noteTitle == '' ?note.title.toString():noteTitle;
    noteDescription = noteDescription == '' ?note.description.toString():noteDescription;
    id = id == 0 ?note.id!:id;
    return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Medicine Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8),
        NoteFormWidget(
          title: noteTitle,
          description: noteDescription,
          onChangedTitle: (title) => setState(() => this.noteTitle = title),
          onChangedDescription: (description) =>
              setState(() => noteDescription = description),
          onSavedTodo: () {
            _updateNoteFromDb();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );}

  _updateNoteFromDb() async {
    print(noteTitle);
    print(noteDescription);
    print(id);
     _noteController.updateNote(noteTitle, noteDescription, id);
    _noteController.getNotes();
  }
}