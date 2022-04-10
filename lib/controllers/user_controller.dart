import 'package:get/get.dart';
import 'package:medicine_remainder_app/db/db_helper.dart';
import 'package:medicine_remainder_app/models/user.dart';



class UserController extends GetxController{

  @override
  void onReady(){
    super.onReady();
  }

  var userList = <User>[].obs;

  Future<int> AddUser({User? user}) async{
    return await DBHelper.insertUser(user);
  }

  void getUsers() async{
    List<Map<String, dynamic>> users = await DBHelper.getAllUsers();
    userList.assignAll(users.map((data) => new User.fromJson(data)).toList());
  }
  //
  // void delete(Reminder reminder){
  //   var val = DBHelper.delete(reminder);
  //   getReminders();
  //   print(val);
  // }
  //
  void updateUserName(int id)async{
    await DBHelper.update(id);
    // getReminders();
  }
}