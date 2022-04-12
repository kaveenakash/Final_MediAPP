import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/note_controller.dart';
import '../../models/Note.dart';
import 'form_widget.dart';

class AddReportDialogWidget extends StatefulWidget {
  @override
  _AddReportDialogWidgetState createState() => _AddReportDialogWidgetState();
}

class _AddReportDialogWidgetState extends State<AddReportDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = Get.put(NoteController());
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8),
        FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onSavedTodo: () {
            print(title);
            _addNoteToDb();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );

  _addNoteToDb() async {
    int value = await _noteController.AddNote(
        note: Note(
          title: title,
          description: description
        ));
    _noteController.getNotes();
    print("My id is " + "$value");
  }
}