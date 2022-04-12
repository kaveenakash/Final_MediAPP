import 'package:get/get.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';

import '../models/Note.dart';



class NoteController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var noteList = <Note>[].obs;

  Future<int> AddNote({Note? note}) async{
    return await DBHelper.insertNote(note);
  }

  void getNotes() async{
    List<Map<String, dynamic>> notes = await DBHelper.getAllNotes();
    noteList.assignAll(notes.map((data) => new Note.fromJson(data)).toList());
  }
  //
  void delete(Note note){
    var val = DBHelper.deleteNote(note);
    getNotes();
    print(val);
  }
  //
  // void markRemindCompleted(int id)async{
  //   await DBHelper.update(id);
  //   getReminders();
  // }
}