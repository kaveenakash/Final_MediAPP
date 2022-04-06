import 'package:get/get.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';
import 'package:medicine_remainder_app/models/reminder.dart';



class ReminderController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var reminderList = <Reminder>[].obs;

  Future<int> AddReminder({Reminder? reminder}) async{
    return await DBHelper.insert(reminder);
  } 

  void getReminders() async{
    List<Map<String, dynamic>> reminders = await DBHelper.query();
    reminderList.assignAll(reminders.map((data) => new Reminder.fromJson(data)).toList());
  }

  void delete(Reminder reminder){
    var val = DBHelper.delete(reminder);
     getReminders();
    print(val);
  }

  void markRemindCompleted(int id)async{
    await DBHelper.update(id);
    getReminders();
  }
}